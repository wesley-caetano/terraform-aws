resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true

  tags = {
    Name = "vpc-prova"
  }
}

resource "aws_subnet" "subnet_public_a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_public_a
  availability_zone = var.az_a

  tags = {
    Name = "Subnet_publica_a"
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_public_b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_public_b
  availability_zone = var.az_b

  tags = {
    Name = "Subnet_publica_b"
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_public_vpc" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_public_vpc
  availability_zone = var.az_b

  tags = {
    Name = "Subnet_publica_vpc"
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_priv_a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_priv_a
  availability_zone = var.az_a

  tags = {
    Name = "Subnet_privada_a"
  }
}

resource "aws_subnet" "subnet_priv_b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_priv_b
  availability_zone = var.az_b

  tags = {
    Name = "Subnet_privada_b"
  }
}


resource "aws_subnet" "subnet_priv_docker" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr_priv_docker
  availability_zone = var.az_b2

  tags = {
    Name = "Subnet_privada_docker"
  }
}



