resource "aws_instance" "frontend" {
  ami           = "ami-0d64d778de0fdce8d"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.instance_sg.id]

  tags = {
    Name = "Frontend"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-03e722b916fa65716"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.private_subnet_1.id
  security_groups = [aws_security_group.instance_sg.id]

  tags = {
    Name = "Backend"
  }
}

resource "aws_instance" "jump_host" {
  ami           = "ami-03e722b916fa65716"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.instance_sg.id]

  tags = {
    Name = "Jump Host"
  }
}

resource "aws_instance" "bastion_host" {
  ami           = "ami-0daac31e03d86a2f5"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.private_subnet_2.id
  security_groups = [aws_security_group.instance_sg.id]

  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_instance" "prometheus_server" {
  ami           = "ami-0daac31e03d86a2f5"  
  instance_type = "t2.micro"
  key_name      = "devops-key-pair"
  subnet_id     = aws_subnet.private_subnet_1.id  # Specify the subnet where Prometheus should be deployed

  # Correct the security group reference
  security_groups = [aws_security_group.prometheus_sg.id]

  tags = {
    Name = "PrometheusServer"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/doyin/devops-key-pair.pem")
    host        = self.public_ip
  }
}

