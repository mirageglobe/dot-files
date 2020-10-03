resource "aws_iam_user" "example" {
  count = 3
  name  = "neo"
}
