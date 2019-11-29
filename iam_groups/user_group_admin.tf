resource "aws_iam_group" "admin_group" {
    name = "Admins"
    path = "/"
}

resource "aws_iam_group_policy_attachment" "policy_administrator_access" {
    group      = "${aws_iam_group.admin_group.name}"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}