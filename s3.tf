resource "aws_s3_bucket" "s3_bucket" {
  bucket = "unique-bucket-devops"

  tags = {
    Name        = "S3 Bucket"
    Environment = "DevOps"
  }
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id       = aws_vpc.devops_vpc.id
  service_name = "com.amazonaws.${var.region}.s3"

  tags = {
    Name = "S3 VPC Endpoint"
  }
}
