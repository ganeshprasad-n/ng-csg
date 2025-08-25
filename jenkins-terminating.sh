#!/bin/bash
###############################################################################
# Script Name : jenkins-terminating.sh
# Version     : 1.0
# Author      : Ganeshprasad N
# Created     : 25 August 2025
# Description : Simple script to destroy Terraform infrastructure in Jenkins,
#               This script runs inside Jenkins Freestyle job
#               It destroys the Jenkins build machine in pfinternal AWS account
# Usage       : sh jenkins-terminating.sh
# Notes       : Make sure you are authenticated to AWS.
###############################################################################

# Show current AWS environment variables
echo "AWS_ACCESS_KEY_ID is set: ${AWS_ACCESS_KEY_ID:+Yes}"
echo "AWS_SECRET_ACCESS_KEY is set: ${AWS_SECRET_ACCESS_KEY:+Yes}"

# Set AWS region
export AWS_DEFAULT_REGION="us-east-1"

# Initialize Terraform
terraform init
if [ $? -ne 0 ]; then
  echo "❌terraform init failed, trying with -reconfigure..."
  terraform init -reconfigure
  if [ $? -ne 0 ]; then
    echo "❌terraform init -reconfigure also failed. Exiting."
    exit 1
  fi
fi

# Validate Terraform configuration
terraform validate
if [ $? -ne 0 ]; then
  echo "❌Terraform validate failed! Please fix your configuration."
  exit 1
fi

# Destroy infrastructure
echo "⚠️ About to destroy all Terraform-managed resources..."
terraform destroy -auto-approve
if [ $? -ne 0 ]; then
  echo "❌Terraform destroy failed!"
  exit 1
fi

echo "✅Terraform destroy completed successfully. Jenkins build machine and resources removed."