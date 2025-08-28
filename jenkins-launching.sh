#!/bin/bash
###############################################################################
# Script Name : jenkins-launching.sh
# Version     : 1.0
# Author      : Ganeshprasad N
# Created     : 11 August 2025
# Description : Simple script to run Terraform commands in Jenkins,
#			  This script runs inside Jenkins Freestyle job
#               It launches Jenkins build machine in pfinternal AWS account using Terraform
# Usage       : sh jenkins-launching.sh
# Notes       : Make sure you are authenticated to AWS.
###############################################################################

# Show current AWS environment variables
echo "AWS_ACCESS_KEY_ID is set: ${AWS_ACCESS_KEY_ID:+Yes}"
echo "AWS_SECRET_ACCESS_KEY is set: ${AWS_SECRET_ACCESS_KEY:+Yes}"

# Set AWS region
export AWS_DEFAULT_REGION="us-east-1"

# Initialize Terraform (downloads provider plugins)
terraform init
if [ $? -ne 0 ]; then
  echo "❌terraform init failed, trying with -reconfigure..."
  terraform init -reconfigure
  if [ $? -ne 0 ]; then
    echo "❌terraform init -reconfigure also failed. Exiting."
    exit 1
  fi
fi

# Validate Terraform configuration files
terraform validate

if [ $? -ne 0 ]; then
  echo "❌Terraform validate failed! Please fix your configuration."
  exit 1
fi

# Create execution plan and save it
terraform plan -out=tfplan

if [ $? -ne 0 ]; then
  echo "❌Terraform plan failed!"
  exit 1
fi
echo "✅Terraform init, validate and plan stages are success, launching Jenkins build machine"

# Apply the plan automatically
terraform apply -auto-approve tfplan

if [ $? -ne 0 ]; then
  echo "❌Terraform apply failed!"
  exit 1
fi
echo "✅Jenkins machine launched successfully and Elastic IP '18.215.60.15' also attached"
