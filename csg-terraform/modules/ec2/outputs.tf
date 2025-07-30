output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.jenkins_server.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.jenkins_server.arn
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jenkins_server.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.jenkins_server.private_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.jenkins_server.public_dns
}

output "eip_association_id" {
  description = "ID of the EIP association"
  value       = aws_eip_association.jenkins_eip_attachment.id
}