output "key_arn" {
  value       = "${aws_kms_key.my-app.arn}"
  description = "Key ARN"
}
output "key_id" {
  value       = "${aws_kms_key.my-app.key_id}"
  description = "Key ID"
}
output "alias_arn" {
  value       = "${aws_kms_alias.my-app.arn}"
  description = "Alias ARN"
}
output "alias_name" {
  value       = "${aws_kms_alias.my-app.name}"
  description = "Alias name"
}