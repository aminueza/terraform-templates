resource "aws_iam_group" "developer_groups" {
    name = "Developers"
    path = "/"
}

resource "aws_iam_group_policy" "developers_sts" {
    name = "${var.aws_role_name}"
    group = "${aws_iam_group.developers.id}"

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "arn:aws:iam::${var.aws_master_account_id}:role/${var.aws_role_name}"
  }
}
EOF
}

resource "aws_iam_group_policy" "developers_user_policy" {
    name = "developers_user_iam"
    group = "${aws_iam_group.developer_groups.id}"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:ListUsers",
                "iam:GetAccountPasswordPolicy"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:*AccessKey*",
                "iam:GetUser",
                "iam:*ServiceSpecificCredential*",
                "iam:*SigningCertificate*",
                "iam:CreateVirtualMFADevice",
                "iam:DeleteVirtualMFADevice",
                "iam:EnableMFADevice",
                "iam:ResyncMFADevice"
            ],
            "Resource": [
                "arn:aws:iam::*:mfa/$${aws:username}",
                "arn:aws:iam::*:user/$${aws:username}"
            ]
        },
        {
            "Sid": "ViewAccountPasswordRequirements",
            "Effect": "Allow",
            "Action": "iam:GetAccountPasswordPolicy",
            "Resource": "*"
        },
        {
            "Sid": "ChangeOwnPassword",
            "Effect": "Allow",
            "Action": [
                "iam:GetUser",
                "iam:ChangePassword"
            ],
            "Resource": "arn:aws:iam::*:user/$${aws:username}"
        }
    ]
}
EOF
}

resource "aws_iam_group_policy" "developers_bucket_policy" {
    name = "developers_bucket_policy_rw"
    group = "${aws_iam_group.developer_groups.id}"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowListBucketObjectOperations",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetObject",
                "s3:HeadObject",
                "s3:HeadBucket",
                "s3:ListBucket",
                "s3:ListObjects",
                "s3:DeleteObject",
                "s3:PutObject"
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

resource "aws_iam_group_policy_attachment" "dev_policy_readonly" {
    group      = "${aws_iam_group.developer_groups.name}"
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dev_cloud_front_readonly" {
    group      = "${aws_iam_group.developer_groups.name}"
    policy_arn = "arn:aws:iam::aws:policy/CloudFrontReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dev_cloud_watch_readonly" {
    group      = "${aws_iam_group.developer_groups.name}"
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dev_support" {
    group      = "${aws_iam_group.developer_groups.name}"
    policy_arn = "arn:aws:iam::aws:policy/AWSSupportAccess"
}
