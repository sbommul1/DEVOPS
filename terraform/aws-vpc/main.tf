terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
}

provider "aws" {
    region = "eu-north-1"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = { Name = "my_vpc"} 
}

resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my_vpc.id
    tags = {Name = "private_subnet"}
}

resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my_vpc.id
    tags = {Name = "public_subnet"}  
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {Name = "my_igw"} 
}

resource "aws_route_table" "myrt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
}

resource "aws_route_table_association" "public_sub" {
    route_table_id = aws_route_table.myrt.id
    subnet_id = aws_subnet.public_subnet.id
  
}

resource "aws_instance" "myserver" {
    ami = "ami-0989038dff76173d3"
    instance_type = "t3.medium"
    tags = {Name= "my-terraform-server"}
    subnet_id = aws_subnet.public_subnet.id
}