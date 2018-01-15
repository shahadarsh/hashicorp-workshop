terraform {
  backend "s3" {
    key = "aws-vpc-terraform/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "${var.region}"
}