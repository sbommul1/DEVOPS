terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
}


provider "aws" {
    region = var.region 
}

locals {
    project = "project-01"
}

resource "aws_vpc" "my-vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "${local.project}-vpc"
    }
}

resource "aws_subnet" "main" {
    count = 2
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    tags = {
        Name = "${local.project}-subnet-${count.index}"
    }
}

resource "aws_instance" "main" {
    count = 4
    ami                         = "ami-0c0e147c706360bd7"
    instance_type               = "t3.nano"
    subnet_id = element(aws_subnet.main[*].id, count.index%length(aws_subnet.main))
    tags = {
        Name = "${local.project}-myinstance-$(count.index)"
    }
}




