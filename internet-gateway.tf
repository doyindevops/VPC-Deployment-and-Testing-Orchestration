# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Public Route Table Association (Public Subnet 1)
resource "aws_route_table_association" "public_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

# Public Route Table Association (Public Subnet 2)
resource "aws_route_table_association" "public_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "Private Route Table"
  }
}

# Private Route Table Association (Private Subnet 1)
resource "aws_route_table_association" "private_association_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

# Private Route Table Association (Private Subnet 2)
resource "aws_route_table_association" "private_association_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

# S3 VPC Endpoint
resource "aws_vpc_endpoint" "s3_vpc_endpoint" {
  vpc_id            = aws_vpc.devops_vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.public_rt.id,
    aws_route_table.private_rt.id
  ]

  tags = {
    Name = "S3 VPC Endpoint"
  }
}
