resource "aws_instance" "bastion" {
  ami = "ami-02db68a01488594c5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet1.id
  associate_public_ip_address = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "bastion"
  } 
}