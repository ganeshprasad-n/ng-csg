output "jenkins_instance_id" {
  description = "ID of the Jenkins EC2 instance"
  value       = module.jenkins_ec2.instance_id
}

output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins server"
  value       = module.jenkins_ec2.instance_public_ip
}

output "jenkins_private_ip" {
  description = "Private IP address of the Jenkins server"
  value       = module.jenkins_ec2.instance_private_ip
}

output "jenkins_public_dns" {
  description = "Public DNS name of the Jenkins server"
  value       = module.jenkins_ec2.instance_public_dns
}

output "jenkins_instance_arn" {
  description = "ARN of the Jenkins EC2 instance"
  value       = module.jenkins_ec2.instance_arn
}