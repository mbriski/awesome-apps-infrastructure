terraform {
  required_providers{
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server1" {
  ami = "ami-0022f774911c1d690"
  key_name = "mbriski-aws"
  instance_type = "t2.micro"
  security_groups = ["EC2-SG"]
  availability_zone= "us-east-1a"
  tags = {
    Name = "app-server-1"
  }
  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install git docker -y
service docker start
usermod -a -G docker ec2-user
EOF
}

resource "aws_instance" "app_server2" {
  ami = "ami-0022f774911c1d690"
  key_name = "mbriski-aws"
  instance_type = "t2.micro"
  security_groups = ["EC2-SG"]
  availability_zone= "us-east-1b"
  tags = {
    Name = "app-server-2"
  }
  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install git docker -y
service docker start
usermod -a -G docker ec2-user
EOF
}

resource "aws_instance" "app_server3" {
  ami = "ami-0022f774911c1d690"
  key_name = "mbriski-aws"
  instance_type = "t2.micro"
  security_groups = ["EC2-SG"]
  availability_zone= "us-east-1c"
  tags = {
    Name = "app-server-3"
  }
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install git docker -y
service docker start
usermod -a -G docker ec2-user
EOF
}

resource "aws_instance" "app_server4" {
  ami = "ami-0022f774911c1d690"
  key_name = "mbriski-aws"
  instance_type = "t2.micro"
  security_groups = ["EC2-SG"]
  availability_zone= "us-east-1d"
  tags = {
    Name = "app-server-4"
  }
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install git docker -y
service docker start
usermod -a -G docker ec2-user
EOF
}
