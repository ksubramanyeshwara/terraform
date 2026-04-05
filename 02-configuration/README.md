# Terraform Configuration

## Providers

- Provider is a plugin that helps terraform to understand where it has to create the infrastructure.
- It used to talk to Cloud APIs.

```sh
provider "aws" {
    region = "us-east-1"
}
```

- This tells terraform: I want to create/manage AWS resource in us-east-1

> Provider will have `terraform{}` block which tells Terraform about which providers are needed and the version of the provider.

- Ensures Correct Provider Version
- Makes Project Reproducible

> required_version = It defines terraform cli version
> required_version = "~>1.2". In this only last part will be upgraded not the others

### Types of Providers

1. Official: Maintained by Hashicorp
2. Partner: Maintained by cloud providers. Ex: Oracle, Alababa
3. Community: Created and Maintained by open source community

### Multiple Regions

### Mutliple Providers

## Resources

- Resources are the actual infrastructure componenets that you want to create/manage
- It defines what infrastructure is created/managed.

```sh
resource "<PROVIDER>_<TYPE>" "<NAME>" {
  key = value
}
```

```sh
resource "aws_instance" "my-server" {
    ami = "ami-12345678"
    instance_type = "t2.micro"
}
```

- Terraform uses resources to:
  - Create: When resource doesn't exists.
  - Update: When config changes.
  - Delete: When removed from the code

## Variables

- It is a placeholder for values

- without variable

```sh
instance_type = "t2.micro"
```

- With variable

```sh
instance_type = var.instance_type
```

### Types of Variable

- Input Variable: Used to pass values
- Output Variable: Used to display result

### Creating Variable

```
variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}
```

### Using Variable

```
resource "aws_instance" "web-server" {
    instance_type = var.instance_type
}
```

Supported types: `string`, `number`, `bool`, `list(...)`, `map(...)`, `object(...)`, `tuple(...)`, `set(...)`

### Output Variable

```
output "instance_ip" {
    value = aws_instance.web-server.public_ip
}
```

## Assiging values to Variables

1. Default Values(inside variables.tf)
   - Best for: Safe defaults and Development setups
   ```
   variable "instance_type" {
       type    = string
       default = "t2.micro"
   }
   ```
2. `.tfvars` File (Most Common)
   - Best for: dev / prod environments and clean separation
   - `terraform.tfvars`
     ```
         instance_type = "t3.micro"
     ```
   - When you run `terraform apply` terrafrom automatically loads `terraform.tfvars`
3. Command Line (`-var`)
   - Best for: Quick testing and Temporary overrides
   - `terraform apply -var="instance_type=t3.small"
   - It overrides everything else

**Priority Order**

1. CLI (-var, -var-file) <- Highest priority
2. tfvars files
3. Default values <- Lowest priority

## Terraform Folder Structure

```
project/
├── main.tf             # Entry point of Terraform code, defines resources, calls modules
├── variables.tf        # Input variable declarations
├── outputs.tf          # Report after applying
├── providers.tf        # Configures the plugins(AWS, Azure, GCP, etc)
├── versions.tf         # Locks terraform & provider versions
├── data.tf             # Data sources (AMIs, SSM params, etc.)
├── locals.tf           # All local values
├── terraform.tfvars    # Actual values that you are passing to variable
├── .gitignore
└── README.md
```

## Conditional Expressions

- Make decision or choose value based on condition.

```
condition ? true_val : false_val
```

- `condition` is an expression that evaluates to either true or false.
- `true_val` is the value that is returned if the condition is true.
- `false_val` is the value that is returned if the condition is false.

```
variable "env" {
    default = "dev"
}

locals {
    instance_type = var.env == "prod" ? "t3.large" : "t2.micro"
}
```

> When you are running `terraform plan` add `-out=pla..tfplan`.

- It will save the plan and you can use the same plan in `terraform apply plan.tfplan`
- Now Terraform will execute exactly what was planned, no surprises.

### When should you use this?

- You want predictability
- In CI/CD pipelines
- In team environments
- For production changes
