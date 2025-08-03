terraform {
  backend "s3" {
    bucket = "ganesh114"
    key    = "ganeshprasad-csg/terraform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-lock-table"
  }
}
