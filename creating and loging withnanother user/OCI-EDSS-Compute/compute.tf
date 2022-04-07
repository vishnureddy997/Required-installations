// List availability domains in Oracle Cloud Infrastructure Core service
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.compartment_ocid
}

// List Vcns in Oracle Cloud Infrastructure Core service.
data "oci_core_vcns" "test_vcns" {
  compartment_id = var.compartment_ocid
}

// List subnets in Oracle Cloud Infrastructure Core service.
data "oci_core_subnets" "test_subnets" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.test_vcns.virtual_networks.0.id
}

// Generate a random string ID
resource "random_id" "instance_id" {
  byte_length = 4
}

resource "oci_core_instance" "test-VM" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD], "name")
  compartment_id      = var.compartment_ocid
  display_name        = "securiti-${random_id.instance_id.hex}-test-VM-new"
  shape               = var.InstanceShape
  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
    user_data           = base64encode(file("./cloud-init_script.sh"))
  }

  timeouts {
    create = "10m"
  }

  create_vnic_details {
    subnet_id = data.oci_core_subnets.test_subnets.subnets.0.id
  }

  source_details {
    source_id               = var.custom-image-ocid
    source_type             = "image"
    boot_volume_size_in_gbs = "200"
  }
  preserve_boot_volume = false
}
output "VM_Private_IP" {
  value = oci_core_instance.test-VM.private_ip
}

output "subnet_id" {
  value = data.oci_core_subnets.test_subnets.subnets.0.id
}

output "virtual_networks_id" {
  description = "returns a list of object"
  value       = data.oci_core_vcns.test_vcns.virtual_networks.0.id
}
