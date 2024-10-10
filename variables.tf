variable "ssh_authorized_keys" {
  description = "SSH public key for instances. For example: ssh-rsa AAEAB3NaC1yc2EAAAA....3xcoeATR ssh-key-2024-09-03"
  type        = string
}

variable "compartment_id" {
  description = "The OCID of the compartment. Find it: Profile - Identity domain: Default - OCID (copy)"
  type        = string
}

variable "num_worker_instances" {
  description = "Number of Coolify worker instances to deploy. 3 is the maximum for free tier."
  type        = number
  default     = 3 # Default number of worker instances
}

variable "availability_domain_main" {
  description = "Availability domain for coolify-main instance. For example: AaJg:EU-FRANKFURT-1-AD-1"
  type        = string
}

variable "availability_domain_workers" {
  description = "Availability domain for coolify-main instance. For example: AaJg:EU-FRANKFURT-1-AD-2"
  type        = string
}

variable "instance_shape" {
  description = "The shape of the instance. VM.Standard.A1.Flex is free tier eligible."
  type        = string
  default     = "VM.Standard.A1.Flex" # OCI Free
}

variable "memory_in_gbs" {
  description = "Memory in GBs for instance shape config. 6 GB is the maximum for free tier with 3 working nodes."
  type        = string
  default     = "6" # OCI Free
}

variable "ocpus" {
  description = "OCPUs for instance shape config. 1 OCPU is the maximum for free tier with 3 working nodes."
  type        = string
  default     = "1" # OCI Free
}

variable "source_image_id" {
  description = "Source image OCID."
  type        = string
  default     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3rxaqcvwe2vxxffm4dfivmfb3apn4inqehxgntjrx3f7p4hzk5rq" # Ubuntu 20.04 LTS
}
