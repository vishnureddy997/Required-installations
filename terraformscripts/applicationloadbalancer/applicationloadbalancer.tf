provider "aws" {
    region = "ap-northeast-1"
    access_key = "AKIAQL6JVCFXJYT66MG2"
    secret_key = "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"
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-0e6b9f5b013f41170", "subnet-08fd9ffd84208e676"]

  enable_deletion_protection = true
   tags = {
    Environment = "production"
  }
}
