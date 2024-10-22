# Coolify Deployment on OCI Free Tier

This Terraform project deploys a Coolify instance along with some worker nodes in the Oracle Cloud Infrastructure (OCI) Free Tier. Coolify is an open-source platform to deploy and manage applications with ease.

## Deploy

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/statickidz/coolify-oci-free/archive/refs/heads/main.zip)

*Clicking the "Deploy to Oracle Cloud" button will load the Oracle Cloud Resource Manager to deploy the infrastructure described in this Terraform project. During deployment, you'll be prompted to configure the stack parameters. Review the settings, then launch the stack deployment.*

## About Coolify

![Coolify Logo](doc/coolify-logo.png)

Coolify is an open-source & self-hostable alternative to Heroku / Netlify / Vercel / etc.

It helps you manage your servers, applications, and databases on your own hardware; you only need an SSH connection. You can manage VPS, Bare Metal, Raspberry PIs, and anything else.

For more information, take a look at his landing page at [coolify.io](https://coolify.io).

![Coolify Screenshot](doc/coolify-screenshot.webp)

## OCI Free Tier Overview

Oracle Cloud Infrastructure (OCI) offers a Free Tier with resources ideal for light workloads, such as the VM.Standard.E2.1.Micro instance. These resources are free as long as usage remains within the limits.

For detailed information about the free tier, visit [OCI Free Tier](https://www.oracle.com/cloud/free/).

*Note: Free Tier instances are subject to availability, and you might encounter "Out of Capacity" errors. To bypass this, upgrade to a paid account. This keeps your free-tier benefits but removes the capacity limitations, ensuring access to higher-tier resources if needed.*

## Prerequisites

Before deploying, ensure you have the following:
- Oracle Cloud Infrastructure (OCI) account with Free Tier resources available.
- SSH public key for instance access.

## Add workers to Coolify

First of all, you need to add your private key on your `Keys & Tokens` section in order to connect to the worker instances.

#### Steps to add worker servers
- Go to Servers > Add
    - Name: The name of the server
    - IP Address/Domain: If you want to use a wildcard domain use the private instance IP, otherwise take the public one.
    - User: root
    - Private Key: The one you created previously.
- Check your proxy is running and you are good to go.

## Project Structure

-   `bin/`: Contains bash scripts for setting up Coolify on both the main instance and the worker instances.
    -   `coolify-main.sh`: Script to install Coolify on the main instance.
    -   `coolify-worker.sh`: Script to configure necessary dependencies on worker instances.
-   `doc/`: Directory for images used in the README (e.g., screenshots of Coolify setup).
-   `helper.tf`: Contains helper functions and reusable modules to streamline the infrastructure setup.
-   `locals.tf`: Defines local values used throughout the Terraform configuration, such as dynamic values or reusable expressions.
-   `main.tf`: Core Terraform configuration file that defines the infrastructure for Coolify's main and worker instances.
-   `network.tf`: Configuration for setting up the required OCI networking resources (VCNs, subnets, security lists, etc.).
-   `output.tf`: Specifies the output variables such as the IP addresses for the dashboard and worker nodes.
-   `providers.tf`: Declares the required cloud providers and versions, particularly for Oracle Cloud Infrastructure.
-   `README.md`: This file, providing instructions on deployment and usage.
-   `variables.tf`: Defines input variables used in the project, including compartment ID, SSH keys, instance shape, and more.

## Terraform Variables

The following variables are defined in `variables.tf`:

- `ssh_authorized_keys`: Your SSH public key to access the instances.
- `compartment_id`: OCI compartment where instances will be deployed.
- `num_worker_instances`: Number of Coolify worker instances to deploy.
- `availability_domain_main`: Availability domains to deploy the main instance.
- `availability_domain_workers`: Availability domains to deploy the worker instances.
- `instance_shape`: The shape (e.g., VM.Standard.E2.1.Micro) to be used for the instances.
- `memory_in_gbs`: The memory allocated to each instance.
- `ocpus`: Number of OCPUs allocated to each instance.