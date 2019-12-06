variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "kms_namespace" {
  type    = string
  default = "development"
}

variable "kms_name" {
  type    = string
  default = "myapp"
}

variable "deletion_window_in_days" {
  default     = 7
  description = "Duration in days after which the key is deleted after destruction of the resource"
}

variable "enable_key_rotation" {
  default = "false"
}

variable "kms_description" {
  type        = string
  default     = "KMS for my personal app"
  description = "The description of the key as viewed in AWS console"
}

variable "kms_alias" {
  type        = string
  default     = ""
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash"
}

