variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "aws_bucket_name" {
  description = "AWS S3 bucket name"
  default     = "aws_terraform_s3"
}
