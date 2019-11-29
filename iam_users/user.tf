resource "aws_iam_user" "aws_user" {
    name = "aws_user"
    path = "/"

    tags = {}
}

resource "aws_iam_user_group_membership" "aws_user_groups" {
    user = "${aws_iam_user.aws_user.name}"

    groups = [
        "Admin","Developers"
    ]
}

# If you want to give extras permission to user, otherwide group permissions is enough
resource "aws_iam_user_policy" "aws_user_policy" {
    name = "s3_access"
    user = "${aws_iam_user.aws_user.name}"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:HeadObject",
                "s3:Put*",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.aws_bucket_name}",
                "arn:aws:s3:::${var.aws_bucket_name}/*"
            ]
        }
    ]
}
EOF
}

# Allow to user changes password
resource "aws_iam_user_policy_attachment" "aws_user_IAMUserChangePassword" {
    user      = "${aws_iam_user.aws_user.name}"
    policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}