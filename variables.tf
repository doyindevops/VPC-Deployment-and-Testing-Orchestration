variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "instance_type" {
  description = "The instance type for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instances"
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key for API operations."
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key for API operations."
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}

variable "mariadb_password" {
  description = "The password for the MariaDB root user."
  type        = string
  sensitive   = true
}

variable "rds_db_password" {
  description = "The password for the RDS instance."
  type        = string
  sensitive   = true
}
