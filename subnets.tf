resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "us-east-1a"
  tags =  {
    Name = "public_subnet1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.4.0/24"
  availability_zone = "us-east-1b"
  tags =  {
    Name = "public_subnet2"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1a"
  tags =  {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1b"
  tags =  {
    Name = "private_subnet2"
  }
}