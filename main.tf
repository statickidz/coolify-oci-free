provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
  availability_domain = var.availability_domain_2
  compartment_id      = var.compartment_id
  create_vnic_details {
    subnet_id = var.subnet_id
  }
  metadata = {
    "ssh_authorized_keys" = var.ssh_authorized_keys
  }
  shape = var.instance_shape
  shape_config {
    memory_in_gbs = var.memory_in_gbs
    ocpus         = var.ocpus
  }
  source_details {
    source_id   = var.source_image_id
    source_type = "image"
  }
}

resource "oci_core_instance" "generated_oci_worker_instance_1" {
  availability_domain = var.availability_domain_3
  compartment_id      = var.compartment_id
  create_vnic_details {
    subnet_id = var.subnet_id
  }
  metadata = {
    "ssh_authorized_keys" = var.ssh_authorized_keys
  }
  shape = var.instance_shape
  shape_config {
    memory_in_gbs = var.memory_in_gbs
    ocpus         = var.ocpus
  }
  source_details {
    source_id   = var.source_image_id
    source_type = "image"
  }
}

resource "oci_core_instance" "generated_oci_worker_instance_2" {
  availability_domain = var.availability_domain_1
  compartment_id      = var.compartment_id
  create_vnic_details {
    subnet_id = var.subnet_id
  }
  metadata = {
    "ssh_authorized_keys" = var.ssh_authorized_keys
  }
  shape = var.instance_shape
  shape_config {
    memory_in_gbs = var.memory_in_gbs
    ocpus         = var.ocpus
  }
  source_details {
    source_id   = var.source_image_id
    source_type = "image"
  }
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
  cidr_block       = "10.0.0.0/16"
  compartment_id   = var.compartment_id
  display_name     = "network-coolify"
  dns_label        = "vcn09121104"
}

resource "oci_core_subnet" "generated_oci_core_subnet" {
  cidr_block       = "10.0.0.0/24"
  compartment_id   = var.compartment_id
  display_name     = "subnet-coolify"
  dns_label        = "subnet09121104"
  route_table_id   = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
  vcn_id           = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
  compartment_id   = var.compartment_id
  display_name     = "Internet Gateway network-coolify"
  enabled          = "true"
  vcn_id           = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_default_route_table" "generated_oci_core_default_route_table" {
  route_rules {
    destination        = "0.0.0.0/0"
    destination_type   = "CIDR_BLOCK"
    network_entity_id  = "${oci_core_internet_gateway.generated_oci_core_internet_gateway.id}"
  }
  manage_default_resource_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
}
