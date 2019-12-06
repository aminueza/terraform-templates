terraform {
  backend "s3" {
    encrypt = true
    bucket = "state-terraform"
    key    = "kms_keys/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "state-terraform"
  }
}
