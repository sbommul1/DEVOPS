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

locals {
    project = "project-01"
}


resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = { Name = "${local.project}-vpc" }
}

resource "aws_subnet" "main" {
    count = 2
    cidr_block = "10.0.${count.index}.0/24"
    vpc_id = aws_vpc.my-vpc.id
    tags = {
      Name = "${local.project}-subnet-${count.index}"
    }
}

resource "aws_instance" "main" {
    for_each = var.ec2_map
    ami = each.value.ami
    instance_type = each.value.instance_type
    subnet_id = element(aws_subnet.main[*].id, index(keys(var.ec2_map), each.key)%length(aws_subnet.main))
    tags = {
      Name = "${local.project}-ec2-${each.key}"
    } 
}

output "aws_instance_public_ip" {
    value = aws_instance.main.public_ip
}   
