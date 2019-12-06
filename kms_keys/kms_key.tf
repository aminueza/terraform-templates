variable "kms-my-app-instances" {
  type = list(string)

  #
  # W A R N I N G ! ! !
  # Please add only at the end of list or we lose keys in the middle after your change.
  #
  default = [
    var.kms_namespace,
  ]
}

resource "aws_kms_key" "kms-my-app" {
  count = length(var.kms-my-app-instances)

  description             = "key for my app in ${element(var.kms-my-app-instances, count.index)}"
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation

  lifecycle {
    # disable deletion of kms keys
    prevent_destroy = true
  }
}

resource "aws_kms_alias" "kms-my-app" {
  count = length(var.kms-my-app-instances)

  name          = "alias/kms_my_app${element(var.kms-my-app-instances, count.index)}"
  target_key_id = element(aws_kms_key.kms-my-app.*.key_id, count.index)

  lifecycle {
    # disable deletion of kms key aliases
    prevent_destroy = true
  }

  depends_on = [aws_kms_key.kms-my-app]
}

## create iam user to access the key
resource "aws_iam_user" "kms-my-app" {
  count = length(var.kms-my-app-instances)

  name = "kms_my_app${element(var.kms-my-app-instances, count.index)}"
  path = "/system/"

  depends_on = [aws_kms_key.kms-my-app]

  lifecycle {
    # disable deletion of iam users for kms
    prevent_destroy = true
  }
}

resource "aws_iam_user_policy" "my-app" {
  count = length(var.kms-my-app-instances)

  name = "kms_my_app_user_permissions_${element(var.kms-my-app-instances, count.index)}"
  user = element(aws_iam_user.kms-my-app.*.name, count.index)

  policy = <<EOF
{
  "Statement": [
    {
        "Effect": "Allow",
        "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
        "Resource": [
            "${element(aws_kms_alias.kms-my-app.*.arn, count.index)}",
            "${element(aws_kms_key.kms-my-app.*.arn, count.index)}"
        ],
        "Condition": {}
    },
    {
        "Effect": "Allow",
        "Action": [
              "kms:GenerateRandom"
          ],
        "Resource": [
            "*"
        ],
        "Condition": {}
    }
  ]
}
EOF


  # make sure key is created before making user
  depends_on = [aws_kms_key.kms-my-app]
}