provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "k8s_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_a" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.k8s_vpc.id
  availability_zone = "eu-central-1a"
}

resource "aws_security_group" "k8s_sg" {
  name_prefix = "k8s-sg-"
}

resource "aws_instance" "master" {
  ami           = "ami-0766f68f0b06ab145"  
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_a.id
  security_groups = [aws_security_group.k8s_sg.id]
}
