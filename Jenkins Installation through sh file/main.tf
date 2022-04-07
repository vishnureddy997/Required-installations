provider "aws" {
    access_key = "AKIA4KXS4OTQVB5C5QFZ"
    secret_key = "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"
    region = "ap-southeast-2"
}
resource "aws_instance" "app" {
  ami                    = "ami-05654370f5b5eb0b0"
  instance_type          = "t2.micro"
  key_name               = "sydney"
  vpc_security_group_ids = ["${aws_security_group.web1.id}"]
  tags = {
    Name = "JenkinsInstallation"
  }
}
terraform {
  required_providers {
    jenkins = {
      source = "overmike/jenkins"
     version = "0.6.1"
   }
  }
}
provider jenkins {
  server_url = "http://3.25.243.184:8080/" # Or use JENKINS_URL env var
  username   = "Vishnu"            # Or use JENKINS_USERNAME env var
  password   = "Reddy@123"            # Or use JENKINS_PASSWORD env var                       # Or use JENKINS_CA_CERT env var
}
# resource "jenkins_folder" "example" {
#   name = "folder-name"
# }

resource "jenkins_job" "example" {
  name     = "example"
  template = templatefile("${path.module}/job.xml", {
    description = "An example job created from Terraform"
  })
}

resource "null_resource" "copy_execute" {

  connection {
    type        = "ssh"
    host        = aws_instance.app.public_ip
    user        = "ubuntu"
    private_key = file("sydney.pem")

  }
  provisioner "file" {
    source      = "jenkins.sh"
    destination = "/home/ubuntu/jenkins.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /home/ubuntu/jenkins.sh",
      "sh /home/ubuntu/jenkins.sh",
    ]
  }

}

resource "aws_security_group" "web1" {
  name = "weba"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
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

