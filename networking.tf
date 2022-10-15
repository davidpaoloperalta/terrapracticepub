resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "${var.project}-vpc"
    }
}

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.project}-ig"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.public_subnet_cidr
    availability_zone       =  var.availability_zone
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project}-public"
    }

}

resource "aws_route_table" "public"{
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.project}-public-rt"
    }
}

resource "aws_route" "public_internet_gateway" {
    route_table_id          = aws_route_table.public.id
    destination_cidr_block  =  "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.ig.id
}

resource "aws_route_table_association" "public" {
    subnet_id       =  aws_subnet.public_subnet.id 
    route_table_id  = aws_route_table.public.id

}