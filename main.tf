# Instance config
locals {
  instance_config = {
    availability_config = {
      recovery_action = "RESTORE_INSTANCE"
    }
    instance_options = {
      are_legacy_imds_endpoints_disabled = false
    }
    is_pv_encryption_in_transit_enabled = true
    metadata = {
      ssh_authorized_keys = var.ssh_authorized_keys
    }
    shape = var.instance_shape
    shape_config = {
      memory_in_gbs = var.memory_in_gbs
      ocpus         = var.ocpus
    }
    source_details = {
      source_id   = var.source_image_id
      source_type = "image"
    }
  }
}

# Instance resources
resource "oci_core_instance" "coolify_main" {
  display_name        = "coolify-main"
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain_1

  is_pv_encryption_in_transit_enabled = local.instance_config.is_pv_encryption_in_transit_enabled
  shape                               = local.instance_config.shape

  metadata {
    ssh_authorized_keys = local.metadata.ssh_authorized_keys
    user_data           = base64encode(file("./bin/coolify.sh"))
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.coolify_subnet.id
  }

  agent_config {
    is_management_disabled = false
    is_monitoring_disabled = false
  }

  availability_config {
    recovery_action = local.instance_config.availability_config.recovery_action
  }

  instance_options {
    are_legacy_imds_endpoints_disabled = local.instance_config.instance_options.are_legacy_imds_endpoints_disabled
  }

  shape_config {
    memory_in_gbs = local.instance_config.shape_config.memory_in_gbs
    ocpus         = local.instance_config.shape_config.ocpus
  }

  source_details {
    source_id   = local.instance_config.source_details.source_id
    source_type = local.instance_config.source_details.source_type
  }
}

resource "oci_core_instance" "coolify_worker_1" {
  display_name        = "coolify-worker-1"
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain_2

  is_pv_encryption_in_transit_enabled = local.instance_config.is_pv_encryption_in_transit_enabled
  shape                               = local.instance_config.shape

  metadata {
    ssh_authorized_keys = local.metadata.ssh_authorized_keys
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.coolify_subnet.id
  }

  agent_config {
    is_management_disabled = false
    is_monitoring_disabled = false
  }

  availability_config {
    recovery_action = local.instance_config.availability_config.recovery_action
  }

  instance_options {
    are_legacy_imds_endpoints_disabled = local.instance_config.instance_options.are_legacy_imds_endpoints_disabled
  }

  shape_config {
    memory_in_gbs = local.instance_config.shape_config.memory_in_gbs
    ocpus         = local.instance_config.shape_config.ocpus
  }

  source_details {
    source_id   = local.instance_config.source_details.source_id
    source_type = local.instance_config.source_details.source_type
  }
}

resource "oci_core_instance" "coolify_worker_2" {
  display_name        = "coolify-worker-2"
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain_3

  is_pv_encryption_in_transit_enabled = local.instance_config.is_pv_encryption_in_transit_enabled
  shape                               = local.instance_config.shape

  metadata {
    ssh_authorized_keys = local.metadata.ssh_authorized_keys
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.coolify_subnet.id
  }

  agent_config {
    is_management_disabled = false
    is_monitoring_disabled = false
  }

  availability_config {
    recovery_action = local.instance_config.availability_config.recovery_action
  }

  instance_options {
    are_legacy_imds_endpoints_disabled = local.instance_config.instance_options.are_legacy_imds_endpoints_disabled
  }

  shape_config {
    memory_in_gbs = local.instance_config.shape_config.memory_in_gbs
    ocpus         = local.instance_config.shape_config.ocpus
  }

  source_details {
    source_id   = local.instance_config.source_details.source_id
    source_type = local.instance_config.source_details.source_type
  }
}
