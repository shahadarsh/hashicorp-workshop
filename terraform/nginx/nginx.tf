data "terraform_remote_state" "vpc_remotestate" {
  backend = "s3"

  config {
    bucket = "${var.tfstate_s3bucket}"
    key = "aws-vpc-terraform/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "nginx" {
  count = "3"
  ami = "${var.nginx_ami}"
  instance_type = "t2.micro"
  key_name = "key_hashicorp"
  vpc_security_group_ids = ["${aws_security_group.nginx_sg.id}"]
  subnet_id = "${element(data.terraform_remote_state.vpc_remotestate.public_subnets, count.index)}"

  tags = {
    Terraform = "true"
  }
}

resource "aws_security_group" "nginx_sg" {
  name = "nginx_sg"
  description = "Security group for nginx instances"
  vpc_id = "${data.terraform_remote_state.vpc_remotestate.vpc_id}"

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}