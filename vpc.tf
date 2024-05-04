resource "aws_vpc" "vpc-homo" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-homolog"
  }
}

resource "aws_subnet" "subnet-homo" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet01-homolog"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc-homo.id

  tags = {
    Name = "internet-gateway-homolog"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc-homo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route-table-homolog"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet-homo.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_security_group" "security_group" {
  name        = "seurit-group-homolog"
  description = "Permitir acesso a porta 22"
  vpc_id      = aws_vpc.vpc-homo.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
