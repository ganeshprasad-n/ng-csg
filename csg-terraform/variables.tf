# AWS Provider Configuration
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile to use"
  type        = string
  default     = "default"
}

# Infrastructure Variables
variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
  default     = "vpc-0f89a34c628550eab"
}

variable "subnet_id" {
  description = "ID of the existing subnet"
  type        = string
  default     = "subnet-009eb33bc0b8c6ec5"
}

variable "security_group_id" {
  description = "ID of the existing security group"
  type        = string
  default     = "sg-06efa6855996f78de"
}

# EC2 Configuration
variable "ami_id" {
  description = "AMI ID for the Jenkins server"
  type        = string
  default     = "ami-00fee0ea85a548b80"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "pfinternal"
}

variable "eip_allocation_id" {
  description = "Allocation ID of the existing Elastic IP"
  type        = string
  default     = "eipalloc-04506b20f4e4b2761"
}

# Tagging
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "jenkins"
}

variable "instance_name" {
  description = "Name for the Jenkins server"
  type        = string
  default     = "Jenkins-Refactoring-testing"
}