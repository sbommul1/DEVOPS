terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.0.0-beta3"

        }
    }
}

provider "aws" {
    region = var.region
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = { Name = "my-vpc" }
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    count = 2
    tags = {
      Name = "my-subnet-${count.index}"
    }
}

resource "aws_instance" "main" {
    ami = var.ec2_config[count.index].ami
    instance_type = var.ec2_config[count.index].instance_type
    count = length(var.ec2_config)
    subnet_id = aws_subnet.main[count.index].id
    tags = {
      Name = "my-instance-${count.index}"
    }
}

