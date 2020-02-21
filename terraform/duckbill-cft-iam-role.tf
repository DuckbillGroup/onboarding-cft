provider "aws" {
  region = "us-east-1"
}

data "aws_iam_policy_document" "DuckbillGroup_CFT_AssumeRole_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["753095100886"]
    }
  }
}

resource "aws_iam_role" "DuckbillGroup_CFT_role" {
  name               = "DuckbillGroup-CFT"
  assume_role_policy = data.aws_iam_policy_document.DuckbillGroup_CFT_AssumeRole_policy_document.json
}

resource "aws_iam_role_policy_attachment" "DuckbillGroup_CFT_role_attachment" {
  role       = aws_iam_role.DuckbillGroup_CFT_role.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
