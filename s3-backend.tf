terraform {
  backend "s3" {
    bucket         = "ganesh114"
    key            = "ganeshprasad-csg/terraform/terraform.tfstate"      #Run "terraform init -reconfigure" if you changed backend config/location
    region         = "us-east-1"
#   dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
