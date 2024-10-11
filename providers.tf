terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.11.0"
    }
  }
}

provider "oci" {}
