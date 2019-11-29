terraform {
  backend "s3" {
    encrypt = true
    bucket = "state-terraform"
    key    = "iam_groups/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "state-terraform"
  }
}
