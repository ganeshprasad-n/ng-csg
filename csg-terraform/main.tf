module "jenkins_ec2" {
  source = "./modules/ec2"

  # Infrastructure
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id

  # EC2 Configuration
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name           = var.key_name
  eip_allocation_id  = var.eip_allocation_id

  # Tagging
  instance_name = var.instance_name
  environment   = var.environment
  project       = var.project
}