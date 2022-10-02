resource "aws_s3_bucket" "example-s3-terraform" {
  bucket = var.aws_s3_bucket_name
  tags   = var.aws_tags
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.example-s3-terraform.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_vpc" "main-vpc" {
  cidr_block = var.aws_vpc_cidr_block
  tags       = var.aws_tags
}

resource "aws_subnet" "main-subnet-1a" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.aws_subnet-1a
  tags              = var.aws_tags
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags   = var.aws_tags
}

resource "aws_route_table" "main-route-table" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }
  tags = var.aws_tags
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main-subnet-1a.id
  route_table_id = aws_route_table.main-route-table.id
}