terraform {
  backend "s3" {
    bucket         = "ng-terraform-bucket-2"
    key            = "csg-uat/terraform.tfstate"      #Run "terraform init -reconfigure" if you changed backend config/location
    region         = "us-east-2"
#   dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
