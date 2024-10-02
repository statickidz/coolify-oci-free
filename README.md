# Coolify Deployment on OCI Free Tier

This Terraform project deploys a Coolify instance along with some worker nodes in the Oracle Cloud Infrastructure (OCI) Free Tier. Coolify is an open-source platform to deploy and manage applications with ease.

## Prerequisites

Before deploying, ensure you have the following:
- Oracle Cloud Infrastructure (OCI) account with Free Tier resources available.
- OCI CLI configured locally with proper authentication (API key or similar).
- SSH public key for instance access.

## Project Structure

- `main.tf`: Contains the configuration for Coolify instances and workers.
- `variables.tf`: Specifies the required input variables like compartment ID, instance shape, memory, and OCPU count.
- `outputs.tf`: Displays the dashboard and worker instance IPs upon deployment.
- `bin/coolify.sh`: Bash script to install Coolify on the main instance.
- `bin/deps.sh`: Bash script to install necessary dependencies on worker instances.

## Terraform Variables

The following variables must be defined in `variables.tf` or passed during `terraform apply`:

- `compartment_id`: OCI compartment where instances will be deployed.
- `availability_domain_1`, `availability_domain_2`, `availability_domain_3`: Availability domains to deploy the instances.
- `ssh_authorized_keys`: Your SSH public key to access the instances.
- `instance_shape`: The shape (e.g., VM.Standard.E2.1.Micro) to be used for the instances.
- `memory_in_gbs`: The memory allocated to each instance.
- `ocpus`: Number of OCPUs allocated to each instance.
- `source_image_id`: The OCID of the custom or default image to use for the instances.

## Deploy to Oracle Cloud

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/statickidz/coolify-oci-free/main.zip)
