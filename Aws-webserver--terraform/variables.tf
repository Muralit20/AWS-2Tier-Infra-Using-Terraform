variable "aws_region" {
  description = "Region for the VPC"
  default = "ap-southeast-1a"
}
variable "region" {
  description = "AWS region for hosting our your network"
  default = "ap-southeast-1a"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}
variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-0b419c3a4b01d1859"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/home/murali/.ssh/authorized_keys"
}
variable "rds_instance_identifier" {
  default = "terraform-mysql"
}
variable "database_name" {
  default = "test_db"
}
variable "database_password" {}
variable "database_user" {}
