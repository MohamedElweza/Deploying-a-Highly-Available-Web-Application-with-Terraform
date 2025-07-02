
resource "aws_route_table" "publicRT" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "publicRT"
    }
}

resource "aws_route_table" "privateRT" {
   vpc_id = aws_vpc.vpc.id
   tags = {
         Name = "privateRT"
   }
}

resource "aws_route" "private_route" {
    route_table_id = aws_route_table.privateRT.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Nate_Gateway.id
}


resource "aws_route_table_association" "subnet1_association" {
    subnet_id = aws_subnet.private-subnet1.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "subnet2_association" {
    subnet_id = aws_subnet.private-subnet2.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "subnet3_association" {
    subnet_id = aws_subnet.public-subnet1.id
    route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "subnet4_association" {
    subnet_id = aws_subnet.public-subnet2.id
    route_table_id = aws_route_table.publicRT.id
}