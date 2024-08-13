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

output "frontend_instance_id" {
  value = aws_instance.frontend.id
}

output "backend_instance_id" {
  value = aws_instance.backend.id
}

output "jump_host_instance_id" {
  value = aws_instance.jump_host.id
}

output "bastion_host_instance_id" {
  value = aws_instance.bastion_host.id
}
