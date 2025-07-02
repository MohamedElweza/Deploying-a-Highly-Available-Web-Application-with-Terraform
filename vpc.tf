resource "aws_vpc" "main vpc" {
  cidr_block = "192.164.0.0/16"
  tags = {
    Name = "tf_vpc"
  }
}