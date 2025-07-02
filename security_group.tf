
# Create a security group that allows HTTP and SSH access for servers
resource "aws_security_group" "HTTP-SG" {
  vpc_id = aws_vpc.vpc.id
  # Allow inbound HTTP access
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # SSH access
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Ephemeral ports
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "HTTP-SG"
    }
}

# Create a security group that allows HTTP access for bastion host
resource "aws_security_group" "bastion-SG" {
  vpc_id = aws_vpc.vpc.id

    # SSH access
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Ephemeral ports
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "bastion-SG"
    }
}