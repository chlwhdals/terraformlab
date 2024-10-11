terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  # 올바른 프로바이더 소스
      version = "5.13.1"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "example" {
  cidr_block = "172.17.0.0/16"
  tags = {
    Name = "terraform_vpc"
  }
}
