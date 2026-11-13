# AWS Infrastructure with Terraform (VPC & Networking)

[![Terraform](https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform)](https://www.terraform.io/)
[![AWS Provider](https://img.shields.io/badge/AWS%20Provider-~%3E%206.0-FF9900.svg?logo=amazon-aws)](https://registry.terraform.io/providers/hashicorp/aws/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This repository contains Infrastructure as Code (IaC) configurations written in [Terraform](https://www.terraform.io/) to provision AWS networking resources. It sets up an Amazon Virtual Private Cloud (VPC) and a lab subnet, establishing the network foundation for hosting AWS workloads (such as EC2 instances).

---

## Architecture & Resources Provisioned

The Terraform configuration creates the following resources in AWS:

- **Virtual Private Cloud (VPC)**:
  - Resource: `aws_vpc.lab`
  - Name: `terraform-lab-vpc`
  - CIDR Block: `10.0.0.0/16`
- **Subnet**:
  - Resource: `aws_subnet.lab`
  - Name: `terraform-lab-subnet`
  - CIDR Block: `10.0.1.0/24` (associated with the lab VPC)
- **Region**: Configurable via variables (defaults to `ap-southeast-1` - Singapore).

---

## Repository Structure

```text
aws-terraform-vpc-ec2/
├── .gitignore             # Git ignore patterns for Terraform, AWS, and OS artifacts
├── README.md              # Project documentation
└── terraform/
    ├── providers.tf       # Terraform & AWS provider configuration
    ├── variables.tf       # Input variable declarations
    ├── main.tf            # Core AWS resource definitions (VPC, Subnet)
    └── outputs.tf          # Output values (VPC ID, Subnet ID)
```

---

## Prerequisites

Before deploying, ensure you have:

1. **[Terraform CLI](https://developer.hashicorp.com/terraform/downloads)** installed (v1.0 or higher).
2. **[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)** installed and configured.
3. Configured AWS credentials:
   ```bash
   aws configure
   ```
   *(Ensure the IAM user/role has sufficient permissions for VPC and Subnet management).*

---

## Quickstart & Deployment

### 1. Clone the repository
```bash
git clone https://github.com/shiranlakshitha/aws-terraform-vpc-ec2.git
cd aws-terraform-vpc-ec2/terraform
```

### 2. Initialize Terraform
Initializes the working directory and downloads the AWS provider plugin:
```bash
terraform init
```

### 3. Review the execution plan
Generates an execution plan to verify what resources will be created:
```bash
terraform plan
```
*(Optional: override region via `-var="aws_region=us-east-1"`)*

### 4. Apply the configuration
Creates the resources in AWS:
```bash
terraform apply
```
Type `yes` when prompted to confirm.

### 5. Verify Outputs
Once applied, Terraform displays the created resource IDs:
```bash
terraform output
```

---

## Resource Teardown

To avoid incurring unexpected charges, destroy the created resources when done:

```bash
terraform destroy
```
Type `yes` to confirm resource deletion.

---

## Inputs & Outputs

### Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `aws_region` | AWS region where resources will be provisioned | `string` | `"ap-southeast-1"` | no |

### Outputs

| Name | Description |
|------|-------------|
| `vpc_id` | ID of the created lab VPC |
| `subnet_id` | ID of the created lab Subnet |

---

## Security & Best Practices

- **State Files**: State files (`.tfstate`) and variable definitions with secrets (`*.tfvars`) are excluded from version control via `.gitignore`.
- **Remote Backend**: For production setups or team collaboration, consider configuring an S3 backend with DynamoDB state locking.

---

## License

This project is licensed under the MIT License.
