terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2_created_by_terraform" {
  ami           = "ami-0b825ad86ddcfb907"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2_created_by_terraform"
  }
}
