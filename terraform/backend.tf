terraform {
  backend "s3" {
    bucket         = "proddevopsaws-tf-state"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}