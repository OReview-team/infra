terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

resource "aws_vpc" "virtual_private_cloud" {
  cidr_block           = "192.168.0.0/20"
  instance_tenancy     = "default"
  enable_dns_hostnames = true # 해당 VPC 내 인스턴스에 Public DNS 호스트 이름을 할당할지 여부

  tags = {
    Service_Name = var.service_name
    Environment  = var.environment
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.virtual_private_cloud.id

  tags = {
    Service_Name = var.service_name
    Environment  = var.environment
  }
}

resource "aws_eip" "eip_nat" {
  domain = "vpc"

  tags = {
    Service_Name = var.service_name
    Environment  = var.environment
  }
}

resource "aws_nat_gateway" "vpc_nat_2a" {
  subnet_id = aws_subnet.vpc_public_subnet_2a.id
}

# resource "aws_nat_gateway" "vpc_nat_2c" {
#   subnet_id = aws_subnet.vpc_public_subnet_2c.id
# }