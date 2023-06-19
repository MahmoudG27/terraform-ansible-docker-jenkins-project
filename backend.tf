terraform {
  backend "s3" {
    bucket         = "terra-bucket-mg"
    key            = "iti/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terra-backend"
  }
}