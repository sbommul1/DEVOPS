terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
  backend "s3" {
    bucket = "sbommul1-bucket-51958d91e812056d"
    key = "backend.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  # Configuration options
  region= var.region
}

resource "aws_instance" "my-terraform-server" {
    ami = "ami-0989038dff76173d3"
    instance_type = "t3.medium"
    tags = {Name= "my-terraform-server"} 
}