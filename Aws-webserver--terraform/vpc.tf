resource "aws_key_pair" "mskey" {
  key_name = "vpctestkeypair"
  public_key = "${file("${var.key_path}")}"
}
resource "aws_vpc" "mivpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "test-vpc"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.mivpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "Web Public Subnet"
  }
}
resource "aws_internet_gateway" "migw" {
  vpc_id = "${aws_vpc.mivpc.id}"

  tags {
    Name = "VPC IGW"
  }
}
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.mivpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.migw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}
