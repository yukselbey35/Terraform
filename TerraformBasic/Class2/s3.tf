resource "aws_s3_bucket" "b" {
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
