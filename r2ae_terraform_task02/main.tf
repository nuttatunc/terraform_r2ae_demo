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


variable "instance_names" {
  type    = list(string)
  default = ["ec2_created_by_terraform_01", "ec2_created_by_terraform_02"]
}

variable "ami_id" {
  type    = string
  default = "ami-0b825ad86ddcfb907"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

locals {
  instances = [
    for name in var.instance_names : {
      name          = name
      instance_type = var.instance_type
      ami           = var.ami_id
    }
  ]
}

resource "aws_instance" "ec2_created_by_terraform" {
  count         = length(local.instances)
  ami           = local.instances[count.index].ami
  instance_type = local.instances[count.index].instance_type

  tags = {
    Name = local.instances[count.index].name
  }
}

output "instance_ids" {
  value = aws_instance.ec2_created_by_terraform[*].id
}
