variable "region" {
  description = "The AWS region to deploy in"
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "key_name" {
  description = "The key pair name for EC2 instances"
  default     = "devops-key-pair"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.large"
}

# RDS Database Password
variable "rds_db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

# MariaDB Container Password
variable "mariadb_password" {
  description = "The password for the MariaDB root user"
  type        = string
  sensitive   = true
}


