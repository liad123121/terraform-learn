variable "ACCESS-KEY" {
    description = "access key aws"
}

variable "SECRET-KEY" {
    description = "secret key aws"
}

provider "aws" {
    region = "eu-west-3"
    access_key = var.ACCESS-KEY
    secret_key = var.SECRET-KEY
    //AWS_SECRET_ACCESS_KEY
    //AWS_ACCESS_KEY_ID
}

variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable avail_zone {}
variable env_prefix {}

resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name: "${var.env_prefix}-vpc"
    }
}

resource "aws_subnet" "myapp-subnet-1" {
    vpc_id = aws_vpc.myapp-vpc.id
    cidr_block = subnet_cidr_block
    tags {
        Name: "${var.env_prefix}-subnet"
    }
}
