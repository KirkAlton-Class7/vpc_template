# Public App Subnet Configuration

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-a"
    Access = "public"
    Egress = "IGW"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-b"
    Access = "public"
    Egress = "IGW"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-west-1c"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-c"
    Access = "public"
    Egress = "IGW"
  }
}

# Private App Subnet Configuration

resource "aws_subnet" "private_egress_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.11.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name = "private-egress-a"
    Access = "private"
    Egress = "NAT"
  }
}

resource "aws_subnet" "private_egress_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.22.0/24"
  availability_zone = "us-west-1b"


  tags = {
    Name = "private-egress-b"
    Access = "private"
    Egress = "NAT"
  }
}

resource "aws_subnet" "private_egress_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.33.0/24"
  availability_zone = "us-west-1c"


  tags = {
    Name = "private-egress-c"
    Access = "private"
    Egress = "NAT"
  }
}

# Private Data Subnet Configuration

resource "aws_subnet" "private_data_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.44.0/24"
  availability_zone = "us-west-2a"


  tags = {
    Name = "private-data-a"
    Access = "private"
    Egress = "none"
  }
}

resource "aws_subnet" "private_data_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.55.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "private-data-b"
    Access = "private"
    Egress = "none"
  }
}

resource "aws_subnet" "private_data_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.66.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "private-data-c"
    Access = "private"
    Egress = "none"
  }
}