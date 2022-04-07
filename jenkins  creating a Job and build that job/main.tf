provider "aws" {
    access_key = "AKIA4KXS4OTQVB5C5QFZ"
    secret_key = "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"
    region = "ap-southeast-2"
}
terraform {
  required_providers {
    jenkins = {
      source = "taiidani/jenkins"
      version = "0.9.0"
    }
  }
}

# provider "jenkins" {
#   # Configuration options

provider jenkins {
  server_url = "http://3.25.243.184:8080/" # Or use JENKINS_URL env var
  username   = "${var.username}"            # Or use JENKINS_USERNAME env var
  password   = "${var.password}"                     # Or use JENKINS_PASSWORD env var                       # Or use JENKINS_CA_CERT env var
}
# resource "jenkins_credential_username" "example" {
#   name     = "gitcredentials"
#   username = "vishnureddy997"
#   password = "Reddy@1234567890" # creating credentials in jenkins ( Any other credentials)
# }
# resource "jenkins_credential_secret_text" "example" {
#   name     = "example-username"
#   secret   = "super-secret"
# }
# resource "jenkins_folder" "example" {
#   name = "Tesla"
# }

resource "jenkins_job" "example" {
  name     = "Master"
  # folder      = jenkins_folder.example.id
  template = templatefile("${path.module}/job.xml", {
    description = "An example job created from Terraform"
  })
}