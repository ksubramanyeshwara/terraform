# Infrastructure as a Code (IaC)

- IaC is a method of managing and provisioning infrastructure through code instead of manual processes.
- It allows you to automate the creation, modification, and deletion of infrastructure resources.
- It helps in maintaining consistency, reducing human errors, and speeding up the deployment process.

**Example**:

- Creating a virtual machine
- Configuring security groups
- Setting up VPC, Subnets, etc

Popular of IaC tools:

- Terraform
- Pulumi
- AWS CloudFormation
- Azure Resource Manager (ARM)

# Terraform

- It is an Infrastructure as a Code (IaC) tool developed by HashiCorp.
- It is used to create, manage and update infrastructure resources automatically.
- It tracks the states, deletion, and changes over the time.
- It uses HashiCorp Configuration Language (HCL) to define the infrastructure.

## Why Terraform is used?

- Repeatable: You can create the same setup everytime you run the Terraform code.
- Multi-cloud support: Terraform supports multiple cloud providers like AWS, Azure, GCP, etc.
- State management: Keeps track of the resources it creates and their current state. Before making any changes, it compares the current state with the desired state and shows what it will add, change, or destroy.
- Version control: You can store it in Git and track changes, review infrastructure updates, and roll back if needed.
- Reusability: You can create modules and reuse them in different projects.

## Terraform Installation

### Update the system packages

```sh
sudo apt-get update
```

### Install the Terraform

```sh
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### Verify the installation

```sh
terraform --version
```

## Terraform Architecture

- Terraform Core: The main component that reads the configuration files and manages the resources.
- Terraform Providers: Plugins that interact with the cloud providers.
- Terraform State: A file that stores the current state of the infrastructure.

## Terraform Workflow

1. Write the configuration file
2. Initialize the Terraform
3. Plan the changes
4. Apply the changes
5. Destroy 

## AWS Configure

- It is a command from AWS CLI to setup AWS credentials locally.
- AWS CLI helps you to interact with AWS services through CLI.
- It stores your:
  - Access Key
  - Secret Key
  - Region
  - Output format

- Run `aws configure` and fill below details

```sh
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]:
Default output format [None]:
```

- You can obtain those values from AWS
- Go to AWS Management Console
- Navigate to IAM > Users > Security Credentials
- Create Access Key

> It is required for Terraform