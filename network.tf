
resource "oci_core_vcn" "coolify_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_id
  display_name   = "network-coolify"
  dns_label      = "vcn09121104"
}

resource "oci_core_subnet" "coolify_subnet" {
  cidr_block     = "10.0.0.0/24"
  compartment_id = var.compartment_id
  display_name   = "subnet-coolify"
  dns_label      = "subnet09121104"
  route_table_id = oci_core_vcn.coolify_vcn.default_route_table_id
  vcn_id         = oci_core_vcn.coolify_vcn.id
}

resource "oci_core_internet_gateway" "coolify_internet_gateway" {
  compartment_id = var.compartment_id
  display_name   = "Internet Gateway network-coolify"
  enabled        = true
  vcn_id         = oci_core_vcn.coolify_vcn.id
}

resource "oci_core_default_route_table" "coolify_default_route_table" {
  manage_default_resource_id = oci_core_vcn.coolify_vcn.default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.coolify_internet_gateway.id
  }
}
