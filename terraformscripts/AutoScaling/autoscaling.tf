provider "aws" {
    region = "ap-northeast-1"
    access_key = "AKIAYX7GVFF57OYXMOH6"
    secret_key = "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"
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "terraform"
  image_id      = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  key_name = "awspractice"
  security_groups = ["${aws_security_group.web1.id}"]
  user_data = <<-EOF
    #! /bin/bash
       sudo apt-get update
       sudo apt install docker.io -y

 EOF
} 

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ap-northeast-1"]
  name                 = "terraform-asg"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 2
  max_size             = 4

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












