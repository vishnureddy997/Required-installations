provider "aws" {
  region     = "ap-northeast-1"
  access_key = "AKIAWY2QSOPRIPFOIA6F"
  secret_key = "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"
}


resource "aws_instance" "web1" {
  ami                    = "ami-088da9557aae42f39"
  instance_type          = "t2.micro"
  key_name               = "awstest"
  vpc_security_group_ids = ["${aws_security_group.web4.id}"]
  tags = {
    Name = "TerraformInstance"
  }

}

resource "null_resource" "copy_execute" {

  connection {
    type        = "ssh"
    host        = aws_instance.web1.public_ip
    user        = "ubuntu"
    private_key = file("awstest.pem")

  }



  provisioner "file" {
    source      = "httpd.sh"
    destination = "/tmp/httpd.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/httpd.sh",
      "sh /tmp/httpd.sh",
    ]
  }

}

resource "aws_security_group" "web4" {
  name = "web4"

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







