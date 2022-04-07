provider "aws" {
    access_key = "AKIAWY2QSOPRIPFOIA6F"
    secret_key = "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"
    region = "ap-northeast-1"
}

resource "aws_instance" "app" {
    ami    = "ami-00bc9b7f0e98dc134"
    instance_type = "t2.micro"
    key_name = "awstest"
    vpc_security_group_ids = ["${aws_security_group.web1.id}"]
    user_data = <<-EOF
     #! /bin/bash
       sudo apt-get update
       sudo apt install docker.io -y

   EOF
    tags = {
        Name = "DockerInstallation"
    }

}

resource "aws_security_group" "web1" {
  name = "web1"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}


resource "aws_ami_copy" "example" {
  name              = "terraform-example"
  description       = "A copy of ami-xxxxxxxx"
  source_ami_id     = "ami-088da9557aae42f39"
  source_ami_region = "ap-northeast-1"

  tags = {
    Name = "HelloWorld"
  }
}