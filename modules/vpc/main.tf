resource "aws_vpc" "acme_vpc" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true


  tags = {

    Name = "acme-vpc"

  }

}

resource "aws_subnet" "public_subnet_a" {

  vpc_id = aws_vpc.acme_vpc.id

  cidr_block = var.public_subnet_a_cidr

  availability_zone = var.availability_zone_a

  map_public_ip_on_launch = true

  tags = {

    Name = "acme-public-subnet-a"

  }

}

resource "aws_subnet" "public_subnet_b" {

  vpc_id = aws_vpc.acme_vpc.id

  cidr_block = var.public_subnet_b_cidr

  availability_zone = var.availability_zone_b

  map_public_ip_on_launch = true

  tags = {

    Name = "acme-public-subnet-b"

  }

}


resource "aws_internet_gateway" "acme_igw" {

  vpc_id = aws_vpc.acme_vpc.id


  tags = {

    Name = "acme-igw"

  }

}

resource "aws_route_table" "acme_public_route_table" {

  vpc_id = aws_vpc.acme_vpc.id


  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.acme_igw.id

  }


  tags = {

    Name = "acme-public-route-table"

  }

}


resource "aws_route_table_association" "public_subnet_a_association" {

  subnet_id = aws_subnet.public_subnet_a.id

  route_table_id = aws_route_table.acme_public_route_table.id

}

resource "aws_route_table_association" "public_subnet_b_association" {

  subnet_id = aws_subnet.public_subnet_b.id

  route_table_id = aws_route_table.acme_public_route_table.id

}
