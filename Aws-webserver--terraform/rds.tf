resource "aws_subnet" "mirds" {
    map_public_ip_on_launch = true
    vpc_id = "${aws_vpc.mivpc.id}"
    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "ap-southeast-1a"
}
resource "aws_db_subnet_group" "midbsubnetg" {
  name        = "${var.rds_instance_identifier}-subnet-group"
  description = "Terraform example RDS subnet group"
  subnet_ids  = ["${aws_subnet.mirds.id}"]
}
resource "aws_security_group" "rds" {
  name        = "terraform_rds_security_group"
  description = "Terraform example RDS MySQL server"
  vpc_id      = "${aws_vpc.mivpc.id}"
  # Keep the instance private by only allowing traffic from the web server.
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.misg.id}"]
  }
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "terraform-example-rds-security-group"
  }
}
