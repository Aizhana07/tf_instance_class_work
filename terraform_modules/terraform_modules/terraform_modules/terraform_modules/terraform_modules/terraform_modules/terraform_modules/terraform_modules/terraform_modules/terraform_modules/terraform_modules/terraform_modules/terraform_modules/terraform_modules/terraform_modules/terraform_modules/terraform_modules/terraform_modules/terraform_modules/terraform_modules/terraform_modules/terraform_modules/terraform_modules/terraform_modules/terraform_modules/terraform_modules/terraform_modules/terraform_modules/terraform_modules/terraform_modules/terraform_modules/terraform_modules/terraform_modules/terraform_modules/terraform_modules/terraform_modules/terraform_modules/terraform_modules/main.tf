terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


variable "image_id" {
  type = string
  default = "ami-03a6eaae9938c858c"

}


variable "ec2_type" {
  type = string
  default = "t2.micro"
}

variable "http_sg_id" {
  type = list
  default  = ["sg-0c112af5c82962962"]
  
}

resource "aws_instance" "my_terraform_instance_1" {
  ami           = var.image_id
  instance_type = var.ec2_type
  vpc_security_group_ids = var.http_sg_id


  tags = {
    Name = "my_terraform_instance_1"
  }
}

resource "aws_instance" "my_terraform_instance_2" {
  ami           = var.image_id
  instance_type = var.ec2_type
  vpc_security_group_ids = var.http_sg_id


  tags = {
    Name = "my_terraform_instance_2"
  }
}
