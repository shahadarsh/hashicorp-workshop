variable "access_key" {}
variable "secret_key" {}
variable "ami" {}
variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_security_group" "sg_nginx" {
  name="sg_nginx"
  description = "Allows all traffic"

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

resource "aws_instance" "nginx" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  count = "3"
  key_name = "key_hashicorp"
  security_groups = ["sg_nginx"]
  depends_on = ["aws_security_group.sg_nginx"]

  tags {
    Name = "nginx-${count.index}"
  }
}

