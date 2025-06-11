terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
    region=var.region
}

resource "random_id" "rand_id" {
  byte_length = 8
  
}

resource "aws_s3_bucket" "sbommul1-bucket" {
  bucket = "sbommul1-bucket-${random_id.rand_id.hex}" 
}

resource "aws_s3_object" "bucket_data" {
  bucket = aws_s3_bucket.sbommul1-bucket.bucket
  source = "./myfile.txt"
  key = "mydata.txt"
}

output "name" {
  value = random_id.rand_id.b64_url 
}