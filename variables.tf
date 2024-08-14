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

variable "prometheus_config" {
  type        = string
  description = "The content of the Prometheus configuration file"
  default     = <<EOF
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
EOF
}
