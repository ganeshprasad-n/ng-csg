data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

data "aws_subnet" "existing_subnet" {
  id = var.subnet_id
}

data "aws_security_group" "existing_security_group" {
  id = var.security_group_id
}

resource "aws_instance" "jenkins_server" {
  ami                        = var.ami_id
  instance_type              = var.instance_type
  subnet_id                  = data.aws_subnet.existing_subnet.id
  vpc_security_group_ids     = [data.aws_security_group.existing_security_group.id]
  key_name                   = var.key_name
  associate_public_ip_address = true

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "terraform"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_eip_association" "jenkins_eip_attachment" {
  instance_id   = aws_instance.jenkins_server.id
  allocation_id = var.eip_allocation_id

  depends_on = [aws_instance.jenkins_server]
}