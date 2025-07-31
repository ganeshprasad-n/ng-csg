# AWS Configuration
aws_region  = "us-east-1"

# Infrastructure IDs (update with your actual resource IDs)
vpc_id            = "vpc-0f89a34c628550eab"
subnet_id         = "subnet-009eb33bc0b8c6ec5"
security_group_id = "sg-06efa6855996f78de"

# EC2 Configuration
ami_id              = "ami-00fee0ea85a548b80"
instance_type       = "t3.xlarge"
key_name           = "pfinternal"
eip_allocation_id  = "eipalloc-04506b20f4e4b2761"

# Tagging
environment   = "dev"
project       = "jenkins"
instance_name = "Jenkins-Refactoring"