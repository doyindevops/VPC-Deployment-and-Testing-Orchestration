terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

terraform {
  backend "s3" {
    bucket         = "devops-statefile-backend2024"
    key            = "terraform/state.tfstate"
    region         = "eu-west-3"
    encrypt        = true
  }
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
  cidr_block        = "10.0.11.0/24"  # Updated to avoid conflict
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Public Subnet 1"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.12.0/24"  # Updated to avoid conflict
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Public Subnet 2"
  }
}

# Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.21.0/24"  # Updated to avoid conflict
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Private Subnet 1"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.22.0/24"  # Updated to avoid conflict
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Private Subnet 2"
  }
}


# EC2 instance to host Docker containers
resource "aws_instance" "docker_host" {
  ami           = "ami-063a331710da39ad1"  # Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name
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
