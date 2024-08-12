terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# VPC configuration
resource "aws_vpc" "devops_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "DevOps VPC"
  }
}

# Public Subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Public Subnet 1"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Public Subnet 2"
  }
}

# Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Private Subnet 1"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Private Subnet 2"
  }
}

# EC2 instance to host Docker containers
resource "aws_instance" "docker_host" {
  ami           = "ami-063a331710da39ad1"  # Amazon Linux 2 AMI
  instance_type = "t3.medium"
  key_name      = "devops-key-pair"
  subnet_id     = aws_subnet.public_subnet_1.id

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              sudo docker run -d -p 6379:6379 --name redis redis:latest
              sudo docker run -d -p 3306:3306 --name mariadb -e MYSQL_ROOT_PASSWORD=${var.mariadb_password} mariadb:latest
              sudo docker run -d -p 9090:9090 --name prometheus -v /etc/prometheus:/etc/prometheus prom/prometheus
              EOF

  tags = {
    Name = "Docker Host"
  }
}

output "instance_public_ip" {
  value = aws_instance.docker_host.public_ip
}
