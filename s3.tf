
resource "aws_s3_bucket" "S3" {
    bucket = "my-s3-bucket"
    force_destroy = true
    tags = {
        Name = "my-s3-bucket"
    }
}