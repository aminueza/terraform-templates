resource "aws_iam_instance_profile" "assume-role-s3" {
  name = "assume-role-s3"
  role = aws_iam_role.role-s3.id
}

resource "aws_iam_role" "role-s3" {
  name = "role-s3"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "role-s3-policy" {
  name = "role-s3-policy"
  role = aws_iam_role.role-s3.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::${var.aws_bucket_name}/*",
            ]
        }
    ]
}
EOF

}