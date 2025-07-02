resource "aws_nat_gateway" "Nate_Gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public-subnet2.id
  tags = {
    Name = "gw NAT"
  }
}

resource "aws_eip" "nat_eip" {
  tags = {
    Name = "gw NAT EIP"
  }
}