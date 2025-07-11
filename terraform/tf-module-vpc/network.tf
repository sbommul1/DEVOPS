provider "aws" {
  region = "eu-north-1"
}

data "aws_availability_zones" "name" {
  state = "available"
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"
  cidr = "10.0.0.0/16"
  private_subnets = ["10.0.0.0/24"]
  public_subnets = ["10.0.1.0/24"]
  azs = data.aws_availability_zones.name.names
  tags = {
    Name = "test-vpc-module"
  }
}
