# AWS Region
variable "aws_region" {}
#variable "aws_profile" {}

# Infrastructure IDs
variable "existing_vpc_id" {}
variable "existing_subnet_id" {}
variable "existing_SG_id" {}

# EC2 Configuration
variable "existing_ami_id" {}
variable "instance_type" {}
variable "existing_key_name" {}
# Tagging
variable "instance_name" {}
variable "environment" {}

#EIP association
variable "existing_eip_allocation_id" {}



