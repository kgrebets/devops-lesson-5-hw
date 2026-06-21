# Terraform AWS Infrastructure Project

## Project Overview

This project uses Terraform to provision AWS infrastructure using reusable modules.

The infrastructure includes:

* S3 bucket for Terraform remote state storage
* DynamoDB table for Terraform state locking
* VPC with public and private subnets
* Internet Gateway and NAT Gateway
* Amazon ECR repository for Docker images

---

## Project Structure

```text
.
├── backend.tf
├── main.tf
├── outputs.tf
├── variables.tf
│
├── modules
│   ├── s3-backend
│   │   ├── variables.tf
│   │   ├── s3.tf
│   │   ├── dynamodb.tf
│   │   └── outputs.tf
│   │
│   ├── vpc
│   │   ├── variables.tf
│   │   ├── vpc.tf
│   │   ├── routes.tf
│   │   └── outputs.tf
│   │
│   └── ecr
│       ├── variables.tf
│       ├── ecr.tf
│       └── outputs.tf
│
└── README.md
```

---

## Terraform Commands

### Initialize Terraform

```bash
terraform init
```

Downloads providers, initializes modules, and configures the backend.

---

### Review Execution Plan

```bash
terraform plan
```

Shows what resources Terraform will create, modify, or destroy.

---

### Apply Infrastructure

```bash
terraform apply
```

Creates or updates AWS infrastructure according to the Terraform configuration.

---

### Destroy Infrastructure

```bash
terraform destroy
```

Removes all resources managed by Terraform.

---

## Modules

### s3-backend

This module creates resources required for Terraform remote state management.

Resources:

* S3 bucket for storing Terraform state files
* S3 versioning for state history
* DynamoDB table for state locking

Outputs:

* S3 bucket name
* DynamoDB table name

---

### vpc

This module creates the networking infrastructure.

Resources:

* VPC
* 3 public subnets
* 3 private subnets
* Internet Gateway
* NAT Gateway
* Route tables
* Route table associations

Outputs:

* VPC ID
* Public subnet IDs
* Private subnet IDs

---

### ecr

This module creates an Amazon Elastic Container Registry (ECR) repository.

Resources:

* ECR repository
* Automatic image vulnerability scanning

Outputs:

* ECR repository URL

---

## Remote State Backend

Terraform uses an S3 backend for storing the state file remotely.

The state is protected with DynamoDB locking to prevent simultaneous changes from multiple users.

Example backend configuration:

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-devops-homework-5"
    key            = "lesson-5/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```
