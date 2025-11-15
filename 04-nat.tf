# Elastic IP Configuration

resource "aws_eip" "main" {
  domain = "vpc"
}

# Nat Configuration

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public_app_c.id

  tags = {
    Name = "main-nat-gw"
  }
  depends_on = [aws_internet_gateway.main]
}