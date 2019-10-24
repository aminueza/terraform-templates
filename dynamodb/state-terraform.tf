resource "aws_dynamodb_table" "terraform-state-lock" {
  name           = "state-terraform"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
        name = "LockID"
        type = "S"
  }
}