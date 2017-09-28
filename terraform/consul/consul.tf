variable "access_key" {}
variable "secret_key" {}
variable "key_name" {}
variable "key_path" {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami = "ami-fce3c696"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  count = "3"
  security_groups = ["${aws_security_group.consul.name}"]

  connection {
    user = "ubuntu"
    private_key = "${file("${var.key_path}")}"
  }

  tags {
    Name = "consul-${count.index}"
    ConsulRole = "Server"
  }

  provisioner "file" {
    source = "scripts/upstart.conf"
    destination = "/tmp/upstart.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${aws_instance.server.0.private_dns} > /tmp/consul-server-addr",
    ]
  }

  provisioner "remote-exec" {
    scripts = [
      "scripts/install.sh",
      "scripts/service.sh",
      "scripts/ip_tables.sh",
    ]
  }
}

resource "aws_security_group" "consul" {
  name = "consul"
  description = "Consul internal traffic + maintenance."

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

