resource "random_id" "ran_id" {
  byte_length = 6
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_id
  display_name   = "vcn-20241011-1038"
  dns_label      = "vcn10111038"
}

# VCN configuration
resource "oci_core_vcn" "coolify_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_id
  display_name   = "network-coolify-${random_id.ran_id.dec}"
  dns_label      = "vcn${random_id.ran_id.dec}"
}

# Subnet configuration
resource "oci_core_subnet" "coolify_subnet" {
  cidr_block     = "10.0.0.0/24"
  compartment_id = var.compartment_id
  display_name   = "subnet-coolify-${random_id.ran_id.dec}"
  dns_label      = "subnet${random_id.ran_id.dec}"
  route_table_id = oci_core_vcn.coolify_vcn.default_route_table_id
  vcn_id         = oci_core_vcn.coolify_vcn.id

  # Attach the security list
  security_list_ids = [oci_core_security_list.coolify_security_list.id]
}

# Internet Gateway configuration
resource "oci_core_internet_gateway" "coolify_internet_gateway" {
  compartment_id = var.compartment_id
  display_name   = "Internet Gateway network-coolify"
  enabled        = true
  vcn_id         = oci_core_vcn.coolify_vcn.id
}

# Default Route Table
resource "oci_core_default_route_table" "coolify_default_route_table" {
  manage_default_resource_id = oci_core_vcn.coolify_vcn.default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.coolify_internet_gateway.id
  }
}

# Security List for Coolify
resource "oci_core_security_list" "coolify_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.coolify_vcn.id
  display_name   = "Coolify Security List"

  # Ingress Rules for Coolify and Reverse Proxy
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 8000
      max = 8000
    }
    description = "Allow HTTP traffic for Coolify on port 8000"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 6001
      max = 6001
    }
    description = "Allow WebSocket traffic for Coolify on port 6001"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 6002
      max = 6002
    }
    description = "Allow terminal traffic for Coolify on port 6002"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
    description = "Allow SSH traffic on port 22"
  }

  # Reverse Proxy (optional)
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 80
      max = 80
    }
    description = "Allow HTTP traffic on port 80"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 443
      max = 443
    }
    description = "Allow HTTPS traffic on port 443"
  }

  # Egress Rule (optional, if needed)
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
    description = "Allow all egress traffic"
  }
}
