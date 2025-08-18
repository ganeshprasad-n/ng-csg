output "instance_id" {
  value = aws_instance.jenkins_server.id
}

output "instance_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "instance_private_ip" {
  value = aws_instance.jenkins_server.private_ip
}

output "attached_eip" {
  value       = data.aws_eip.existing_eip.public_ip
}