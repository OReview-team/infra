resource "aws_subnet" "vpc_public_subnet_2a" {
  vpc_id            = aws_vpc.virtual_private_cloud.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "192.168.1.0/24"

  tags = {
    Service_Name = var.service_name
    Environment  = var.environment
  }
}

resource "aws_subnet" "vpc_public_subnet_2c" {
  vpc_id            = aws_vpc.virtual_private_cloud.id
  availability_zone = "ap-northeast-2c"
  cidr_block        = "192.168.2.0/24"

  tags = {
    Service_Name = var.service_name
    Environment  = var.environment
  }
}

resource "aws_subnet" "vpc_private_subnet_2a" {
  vpc_id            = aws_vpc.virtual_private_cloud.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "192.168.11.0/24"

  tags = {
    Service_Name = var.service_name
    Environment  = var.environment
  }
}

resource "aws_subnet" "vpc_private_subnet_2c" {
  vpc_id            = aws_vpc.virtual_private_cloud.id
  availability_zone = "ap-northeast-2c"
  cidr_block        = "192.168.12.0/24"

  tags = {
    Service_Name = var.service_name
    Environment  = var.environment
  }
}