# Coolify Deployment on OCI Free Tier

This Terraform project deploys a Coolify instance along with some worker nodes in the Oracle Cloud Infrastructure (OCI) Free Tier. Coolify is an open-source platform to deploy and manage applications with ease.

## About Coolify
Coolify is an open-source & self-hostable alternative to Heroku / Netlify / Vercel / etc.

It helps you manage your servers, applications, and databases on your own hardware; you only need an SSH connection. You can manage VPS, Bare Metal, Raspberry PIs, and anything else.

For more information, take a look at his landing page at [coolify.io](https://coolify.io).

## OCI Free Tier Overview
Oracle Cloud Infrastructure offers a Free Tier that provides a limited number of resources for free, including VM.Standard.E2.1.Micro instances, which come with 1 OCPU and 1 GB of RAM. These instances are suitable for light workloads and testing environments like Coolify.

The Free Tier also includes networking and storage options that will allow you to run small-scale applications without incurring any costs, as long as the limits are respected. For more details, refer to [OCI Free Tier](https://www.oracle.com/cloud/free/).

## Prerequisites

Before deploying, ensure you have the following:
- Oracle Cloud Infrastructure (OCI) account with Free Tier resources available.
- SSH public key for instance access.

## Deploy

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/statickidz/coolify-oci-free/archive/refs/heads/main.zip)

Clicking the "Deploy to Oracle Cloud" button will automatically load the Oracle Cloud Resource Manager, which allows you to deploy the entire infrastructure defined in this Terraform project. Before starting the deployment, you will be prompted to configure certain parameters like SSH keys, the number of worker instances, and the OCI compartment. Once you review and confirm, the stack will be deployed.

## Add workers to Coolify

First of all, you need to add your private key on your `Keys & Tokens` section in order to connect to the worker instances.

![coolify-1](img/image-1.png)

#### Steps to add worker servers
- Go to Servers > Add
    - Name: The name of the server
    - IP Address/Domain: If you want to use a wildcard domain use the private instance IP, otherwise take the public one.
    - User: root

    ![coolify-2](img/image-4.png)

- Check your proxy is running and you are good to go.

    ![coolify-3](img/image-2.png)

- Your server screen now should look like this.

    ![coolify-4](img/image-3.png)

## Project Structure

-   `bin/`: Contains bash scripts for setting up Coolify on both the main instance and the worker instances.
    -   `coolify-main.sh`: Script to install Coolify on the main instance.
    -   `coolify-worker.sh`: Script to configure necessary dependencies on worker instances.
-   `img/`: Directory for images used in the README (e.g., screenshots of Coolify setup).
-   `helper.tf`: Contains helper functions and reusable modules to streamline the infrastructure setup.
-   `locals.tf`: Defines local values used throughout the Terraform configuration, such as dynamic values or reusable expressions.
-   `main.tf`: Core Terraform configuration file that defines the infrastructure for Coolify's main and worker instances.
-   `network.tf`: Configuration for setting up the required OCI networking resources (VCNs, subnets, security lists, etc.).
-   `output.tf`: Specifies the output variables such as the IP addresses for the dashboard and worker nodes.
-   `providers.tf`: Declares the required cloud providers and versions, particularly for Oracle Cloud Infrastructure.
-   `README.md`: This file, providing instructions on deployment and usage.
-   `variables.tf`: Defines input variables used in the project, including compartment ID, SSH keys, instance shape, and more.

## Terraform Variables

The following variables must be defined in `variables.tf` or passed during `terraform apply`:

- `ssh_authorized_keys`: Your SSH public key to access the instances.
- `compartment_id`: OCI compartment where instances will be deployed.
- `num_worker_instances`: Number of Coolify worker instances to deploy.
- `availability_domain_main`: Availability domains to deploy the main instance.
- `availability_domain_workers`: Availability domains to deploy the worker instances.
- `instance_shape`: The shape (e.g., VM.Standard.E2.1.Micro) to be used for the instances.
- `memory_in_gbs`: The memory allocated to each instance.
- `ocpus`: Number of OCPUs allocated to each instance.