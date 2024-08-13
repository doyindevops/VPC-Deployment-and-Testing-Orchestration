output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.devops_vpc.id
}

output "frontend_public_ip" {
  description = "The Public IP of the frontend instance"
  value       = aws_instance.frontend.public_ip
}

output "load_balancer_dns_name" {
  description = "The DNS name of the Load Balancer"
  value       = aws_lb.lb.dns_name
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.devops_rds.endpoint
}

output "backend_instance_id" {
  value = aws_instance.correct_resource_name.id  # Replace with the correct resource
}
