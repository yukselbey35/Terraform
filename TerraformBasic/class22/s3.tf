resource "aws_s3_bucket" "b" {
  bucket = "yukselak_az_bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
