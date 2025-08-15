# Jenkins Infrastructure with Terraform

This Terraform configuration deploys a Jenkins server on AWS EC2 using existing VPC infrastructure.

## Structure

```
├── modules/
│   └── ec2/                 # EC2 module
│       ├── main.tf         # EC2 resources
│       ├── variables.tf    # Module variables
│       └── outputs.tf      # Module outputs
├── main.tf                 # Root module
├── variables.tf            # Root variables
├── providers.tf            # Provider configuration
├── outputs.tf              # Root outputs
├── terraform.tfvars.example # Example variables file
└── README.md               # This file
```

## Prerequisites

1. AWS CLI configured with appropriate credentials
2. Terraform >= 1.0 installed
3. Existing AWS resources:
   - VPC
   - Subnet
   - Security Group
   - Elastic IP allocation
   - EC2 Key Pair

## Local Testing

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Create terraform.tfvars:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your actual values
   ```

3. **Plan the deployment:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

5. **Destroy resources (when needed):**
   ```bash
   terraform destroy
   ```

## Jenkins CI/CD Integration

For Jenkins deployment, create a pipeline with these stages:

1. **Checkout:** Pull code from repository
2. **Validate:** `terraform validate`
3. **Plan:** `terraform plan -out=tfplan`
4. **Apply:** `terraform apply tfplan`

### Environment Variables for Jenkins

Set these in Jenkins credentials or environment:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`

## Outputs

After successful deployment, you'll get:
- Jenkins instance ID
- Public and private IP addresses
- Public DNS name
- Instance ARN

## Security Considerations

- Use IAM roles instead of access keys in production
- Implement least privilege access
- Enable CloudTrail for audit logging
- Use encrypted EBS volumes
- Regular security updates

## Best Practices Implemented

- ✅ Modular structure for reusability
- ✅ Proper variable definitions with descriptions
- ✅ Resource tagging for management
- ✅ Output values for integration
- ✅ Version constraints for providers
- ✅ Lifecycle management
- ✅ Dependencies handling
- ✅ Example configuration file