resource "aws_s3_bucket" "r2ae_data_dbt_shane" {
  bucket = "r2ae-data-dbt-shane-terraform"
}

resource "aws_iam_user" "access_user" {
  name = "S3AccessUserTerraform"
}

resource "aws_iam_policy_attachment" "user_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  users      = [aws_iam_user.access_user.name]
  name       = "AmazonS3FullAccess"
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.access_user.name
}