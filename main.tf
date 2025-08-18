# VPC elements
data "aws_vpc" "existing_vpc" {
  id = var.existing_vpc_id
}

data "aws_subnet" "existing_subnet" {
  id = var.existing_subnet_id
}

data "aws_security_group" "existing_security_group" {
  id = var.existing_SG_id
}

# EC2 Configuration
resource "aws_instance" "jenkins_server" {
  ami                         = var.existing_ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.existing_subnet.id
  vpc_security_group_ids      = [data.aws_security_group.existing_security_group.id]
  key_name                    = var.existing_key_name
  associate_public_ip_address = true

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# EIP Association
data "aws_eip" "existing_eip" {
  id = var.existing_eip_allocation_id
}

resource "aws_eip_association" "existing_eip_attachment" {
  instance_id   = aws_instance.jenkins_server.id
  allocation_id = var.existing_eip_allocation_id

  depends_on = [aws_instance.jenkins_server]
}
