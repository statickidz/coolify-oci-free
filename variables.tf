variable "compartment_id" {
  description = "The OCID of the compartment."
  type        = string
}

variable "availability_domain_1" {
  description = "Availability domain for instance 1."
  type        = string
}

variable "availability_domain_2" {
  description = "Availability domain for instance 2."
  type        = string
}

variable "availability_domain_3" {
  description = "Availability domain for instance 3."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID."
  type        = string
  default     = "${oci_core_subnet.generated_oci_core_subnet.id}"
}

variable "ssh_authorized_keys" {
  description = "SSH public key for instances."
  type        = string
}

variable "instance_shape" {
  description = "The shape of the instance."
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "memory_in_gbs" {
  description = "Memory in GBs for instance shape config."
  type        = string
  default     = "6"
}

variable "ocpus" {
  description = "OCPUs for instance shape config."
  type        = string
  default     = "1"
}

variable "source_image_id" {
  description = "Source image OCID."
  type        = string
  default     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3rxaqcvwe2vxxffm4dfivmfb3apn4inqehxgntjrx3f7p4hzk5rq"
}