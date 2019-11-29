variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "aws_master_account_id" {
  description = "AWS ID to root user"
  default     = "3456789"
}

variable "aws_role_name" {
  description = "AWS role name"
  default     = "dev_access"
}

variable "username" {
  description = "AWS role name"
  default     = "test"
}