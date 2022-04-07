variable "tenancy_ocid" {
  default = ""
}

variable "user_ocid" {
  default = ""
}

variable "compartment_ocid" {
  default = ""
}

variable "private_key_path" {
  default = ""
}

variable "fingerprint" {
  default = ""
}

variable "region" {
  default = "us-ashburn-1"
}

variable "ssh_public_key_path" {
  default = ""
}

variable "AD" {
  description = "The availability domain number of the instance. If none is provided, it will start with AD-1 and continue in round-robin."
  default     = "1"
}

variable "InstanceShape" {
  default = "VM.Standard.E2.2"
}

variable "custom-image-ocid" {
  default = "ocid1.image.oc1.iad.aaaaaaaamfn6zjdks6e2vmtfxosm4aqx2p2ndwq4y3233rgkraiszlerizzq"
}
