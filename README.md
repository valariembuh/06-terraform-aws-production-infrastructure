# AWS Production Infrastructure with Terraform

## Project Overview

This project demonstrates how to provision and manage production-style AWS infrastructure using Terraform and reusable modules. The infrastructure is designed using Infrastructure as Code (IaC) principles and includes a custom Virtual Private Cloud (VPC), networking components, security groups, an EC2 web server with automated provisioning, and a remote Terraform backend for secure state management.

The project also demonstrates Terraform best practices by separating infrastructure into reusable modules, using a remote backend stored in Amazon S3, enabling state versioning and encryption, and implementing state locking with DynamoDB.

---

# Project Architecture

The infrastructure provisions the following AWS resources:

* Virtual Private Cloud (VPC)
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association
* Security Group
* EC2 Web Server
* Automated Apache Installation using User Data
* Amazon S3 Remote Backend
* S3 Versioning
* Server-Side Encryption
* DynamoDB State Locking

---

# Technologies Used

* Terraform
* Amazon Web Services (AWS)
* Amazon EC2
* Amazon VPC
* Amazon S3
* Amazon DynamoDB
* AWS CLI
* Linux (Ubuntu / WSL)
* Git
* GitHub

---

# Project Structure

```text
terraform/
│
├── backend.tf
├── data.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── user-data.sh
├── README.md
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── terraform-architecture.png
```

---

# Infrastructure Workflow

1. Terraform initializes the AWS provider.
2. The Root Module calls the VPC Module.
3. The VPC Module creates:

   * VPC
   * Public Subnet
   * Internet Gateway
   * Route Table
   * Route Table Association
4. The VPC Module exports the VPC ID and Subnet ID.
5. The Root Module passes these outputs into the Compute Module.
6. The Compute Module creates:

   * Security Group
   * EC2 Instance
7. User Data automatically installs Apache during instance launch.
8. Terraform stores the infrastructure state in Amazon S3.
9. State locking is handled by DynamoDB to prevent concurrent modifications.

---

# Terraform Modules

## Root Module

Responsible for orchestrating the deployment by calling child modules and passing variables between them.

## VPC Module

Creates the networking layer:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association

Outputs:

* VPC ID
* Subnet ID

## Compute Module

Creates:

* Security Group
* EC2 Instance
* Apache Web Server

---

# Remote Backend

Terraform state is stored remotely using:

* Amazon S3
* Versioning Enabled
* Server-Side Encryption Enabled
* DynamoDB State Locking

Benefits include:

* Centralized state storage
* Team collaboration
* State recovery through versioning
* Secure encrypted state
* Prevention of simultaneous Terraform executions

---

# Screenshots

Include screenshots such as:

* Terraform Plan
* Terraform Apply
* EC2 Running
* Apache Web Server
* Terraform Outputs
* S3 Backend
* DynamoDB Lock Table
* Terraform Architecture Diagram

---

# Skills Demonstrated

* Infrastructure as Code (IaC)
* Terraform Modules
* AWS Networking
* Amazon EC2
* User Data Automation
* Terraform Outputs
* Terraform Variables
* Dynamic AMI Lookup
* Remote State Management
* Amazon S3
* DynamoDB
* Versioning
* Encryption
* Git
* Linux CLI
* AWS CLI
* Infrastructure Troubleshooting

---

# Future Improvements

* Application Load Balancer (ALB)
* Launch Templates
* Auto Scaling Group
* CloudWatch Monitoring
* SNS Notifications
* Multi-AZ High Availability
* Route 53 Integration
* HTTPS using AWS Certificate Manager (ACM)

---

# Author

**Valarie M. Atsimbom**

Cloud Engineering Portfolio

AWS | Terraform | Linux | Networking | Infrastructure as Code
