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

resource "aws_instance" "jenkins" {
  ami = "ami-0022f774911c1d690"
  key_name = "mbriski-aws"
  instance_type = "t2.micro"
  security_groups = ["Jenkins-SG"]
  tags = {
    Name = "jenkins-server"
  }
  user_data = <<-EOF
#!/bin/bash
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade
yum install jenkins -y
amazon-linux-extras install java-openjdk11 -y
systemctl enable jenkins
systemctl start jenkins
systemctl daemon-reload
EOF
}
