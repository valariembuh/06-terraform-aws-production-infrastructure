# AWS Production Infrastructure with Terraform

## Project Overview

This project demonstrates the design and deployment of a production-style, highly available AWS web application infrastructure using Terraform Infrastructure as Code (IaC).

The infrastructure was built using reusable Terraform modules following enterprise cloud engineering practices. The deployment includes networking, compute, load balancing, auto scaling, remote state management, and infrastructure validation.

The goal of this project was to simulate how cloud engineers provision reliable AWS environments using automation instead of manual console configuration.


# Architecture Overview

The deployed architecture follows a highly available AWS design:
                     Internet
                        |
                        |
                     Route 53
                        |
                        |
          Application Load Balancer (ALB)
                        |
                        |
                  ALB Listener :80
                        |
                        |
                Target Group
                        |
         --------------------------------
         |                              |
         |                              |
    EC2 Instance                  EC2 Instance
    us-east-1a                    us-east-1b
         |                              |
         --------------------------------
                        |
                        |
             Auto Scaling Group
                        |
                        |
                 Launch Template


             AWS VPC
    --------------------------------
    |                              |

Public Subnet A Public Subnet B
us-east-1a us-east-1b




# AWS Services Used

| Service | Purpose |
|---|---|
| Amazon VPC | Custom network architecture |
| Public Subnets | Multi-AZ application deployment |
| Internet Gateway | Internet connectivity |
| Route Tables | Network routing |
| Amazon EC2 | Web server instances |
| Launch Template | EC2 configuration automation |
| Auto Scaling Group | High availability and scaling |
| Application Load Balancer | Traffic distribution |
| Target Group | Instance health monitoring |
| Amazon S3 | Terraform remote backend |
| DynamoDB | Terraform state locking |
| IAM | Secure AWS access |


# Terraform Architecture

The project was refactored from traditional Terraform configuration into reusable modules.

## Root Module

The root module controls the overall infrastructure deployment.


terraform/

├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── backend.tf
├── data.tf
│
└── modules/



# Terraform Modules

## VPC Module

Responsible for networking resources:


modules/vpc

├── main.tf
├── variables.tf
└── outputs.tf


Creates:

- VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Route Associations



## Compute Module

Responsible for EC2 deployment:


modules/compute

├── main.tf
├── variable.tf
└── output.tf


Creates:

- Security Group
- EC2 Instance
- Apache Web Server
- User Data automation



## ALB Module

Responsible for application traffic management:


modules/alb

├── main.tf
├── variables.tf
└── outputs.tf


Creates:

- Application Load Balancer
- Listener
- Target Group



## Auto Scaling Module

Responsible for compute availability:


modules/autoscaling

├── main.tf
├── variables.tf
└── outputs.tf


Creates:

- Launch Template
- Auto Scaling Group
- EC2 replacement capability



# Remote Terraform State Management

Terraform state is stored remotely using:

## Amazon S3 Backend

Benefits:

- Centralized state storage
- State versioning
- Disaster recovery capability


## DynamoDB Locking

Benefits:

- Prevents simultaneous Terraform modifications
- Protects infrastructure state consistency

Example:


Terraform
|
|
S3 Bucket
(terraform.tfstate)
|
|
DynamoDB
(state locking)



# Deployment Workflow

Infrastructure was deployed using:


```bash
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
Validation and Testing

Infrastructure was validated using AWS CLI commands.

Target Group Health Check

Command:

aws elbv2 describe-target-health \
--target-group-arn <target-group-arn>

Validation result:

TargetHealth:

healthy
healthy

This confirmed:

EC2 instances were running
Apache service was available
Load balancer health checks passed
Troubleshooting Experience

During deployment, several real infrastructure issues were identified and resolved:

Terraform State Lock Issue

Problem:

Error acquiring the state lock

Solution:

Used Terraform state management tools:

terraform force-unlock <lock-id>
Subnet CIDR Conflict

Problem:

InvalidSubnet.Conflict
CIDR conflicts with another subnet


Solution:

Verified AWS resources:

aws ec2 describe-subnets

Removed conflicting resources and recreated the correct infrastructure.

Module Output Errors

Problem:

Reference to undeclared resource

Solution:

Reviewed Terraform module relationships and corrected:

Resource names
Outputs
Module dependencies
Screenshots

Project deployment evidence is available in:

screenshots/

Included documentation:

Terraform initialization
Terraform validation
Terraform planning
Infrastructure deployment
VPC architecture
Load Balancer creation
Target health verification
AWS resource validation
Skills Demonstrated

This project demonstrates experience with:

Infrastructure as Code (Terraform)
Terraform Modules
AWS Networking
AWS Compute Services
High Availability Architecture
Load Balancing
Auto Scaling
Remote Terraform State
AWS CLI
Linux Administration
Cloud Troubleshooting
Production Infrastructure Design













# Author

*Valarie M. Atsimbom**

Cloud Engineering Portfolio

AWS | Terraform | Linux | Networking | Infrastructure as Code
