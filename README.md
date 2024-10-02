# Coolify Deployment on OCI Free Tier

This Terraform project deploys a Coolify instance along with some worker nodes in the Oracle Cloud Infrastructure (OCI) Free Tier. Coolify is an open-source platform to deploy and manage applications with ease.

## About Coolify
Coolify is an open-source & self-hostable alternative to Heroku / Netlify / Vercel / etc.

It helps you manage your servers, applications, and databases on your own hardware; you only need an SSH connection. You can manage VPS, Bare Metal, Raspberry PIs, and anything else.

For more information, take a look at his landing page at [coolify.io](https://coolify.io).

## Prerequisites

Before deploying, ensure you have the following:
- Oracle Cloud Infrastructure (OCI) account with Free Tier resources available.
- SSH public key for instance access.

## Deploy

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/statickidz/coolify-oci-free/archive/refs/heads/main.zip)

## Add workers to Coolify

First of all, you may find your `localhost` server is not reachable, to solve that you only need to update the user to `ubuntu`.

![coolify-1](img/image.png)

Also, you might need to update your private localhost key on your `Keys & Tokens` section in order to connect to the worker instances.

![coolify-2](img/image-1.png)

#### Steps to add worker servers
- Go to Servers > Add
    - Name: The name of the server
    - IP Address/Domain: If you want to use a wildcard domain use the private instance IP, otherwise take the public one.
    - User: ubuntu
    ![coolify-3](img/image-4.png)
- Check your proxy is running and you are good to go.
    ![coolify-4](img/image-2.png)
- Your server now should look like this.
    ![coolify-5](img/image-3.png)

## Project Structure

- `main.tf`: Contains the configuration for Coolify instances and workers.
- `variables.tf`: Specifies the required input variables like compartment ID, instance shape, memory, and OCPU count.
- `outputs.tf`: Displays the dashboard and worker instance IPs upon deployment.
- `bin/coolify.sh`: Bash script to install Coolify on the main instance.
- `bin/deps.sh`: Bash script to install necessary dependencies on worker instances.

## Terraform Variables

The following variables must be defined in `variables.tf` or passed during `terraform apply`:

- `compartment_id`: OCI compartment where instances will be deployed.
- `availability_domain_1`, `availability_domain_2`, `availability_domain_3`, `availability_domain_4`: Availability domains to deploy the instances.
- `ssh_authorized_keys`: Your SSH public key to access the instances.
- `instance_shape`: The shape (e.g., VM.Standard.E2.1.Micro) to be used for the instances.
- `memory_in_gbs`: The memory allocated to each instance.
- `ocpus`: Number of OCPUs allocated to each instance.
- `source_image_id`: The OCID of the custom or default image to use for the instances.