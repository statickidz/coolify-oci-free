terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.12.0"
    }
  }
}

provider "oci" {}
