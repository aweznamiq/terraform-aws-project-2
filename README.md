# Terraform-Project-2-Multi-Tier-AWS-Architecture
Rebuild the Project 2 AWS architecture using Terraform so the full stack is created as code.
## Architecture Overview

This project implements a production-style AWS multi-tier architecture using Terraform.

Architecture Components:
- Public Application Load Balancer
- Public and Private Subnets
- NAT Gateway
- Private EC2 Application Server
- Private RDS Database
- Session Manager administration
- Internet Gateway and Route Tables

Security Design:
- Only the ALB is publicly accessible
- Backend EC2 and RDS remain private
- Session Manager replaces public SSH access
- 
## Step 1: Configure Terraform and Create VPC

Configured:
- Terraform AWS provider
- reusable variables
- VPC resource definition

Terraform Commands Used:
- terraform init
- terraform validate
- terraform plan
- terraform apply

Infrastructure Created:
- prod-vpc


## Step 2: Create Public Subnets

Created two public subnets inside `prod-vpc`.

Subnet Configuration:
- public-subnet-a → 10.1.1.0/24
- public-subnet-b → 10.1.2.0/24

Both subnets were placed in separate Availability Zones for high availability.
Auto-assign public IP was enabled for future public-facing resources.

## Step 3: Create Private Subnets

Created two private subnets inside `prod-vpc`.

## Step 4: Create and Attach Internet Gateway

Created an Internet Gateway named `prod-igw` and attached it to `prod-vpc`.

Purpose:
The Internet Gateway enables internet connectivity for public-facing resources inside the VPC such as:
- Application Load Balancer
- NAT Gateway
- Public networking components

Subnet Configuration:
- private-subnet-a → 10.1.10.0/24
- private-subnet-b → 10.1.11.0/24

# Terraform-Project-2-Multi-Tier-AWS-Architecture
Rebuild the Project 2 AWS architecture using Terraform so the full stack is created as code.

## Step 1: Configure Terraform and Create VPC

Configured:
- Terraform AWS provider
- reusable variables
- VPC resource definition

Terraform Commands Used:
- terraform init
- terraform validate
- terraform plan
- terraform apply

Infrastructure Created:
- prod-vpc


## Step 2: Create Public Subnets

Created two public subnets inside `prod-vpc`.

Subnet Configuration:
- public-subnet-a → 10.1.1.0/24
- public-subnet-b → 10.1.2.0/24

Both subnets were placed in separate Availability Zones for high availability.
Auto-assign public IP was enabled for future public-facing resources.

## Step 3: Create Private Subnets

Created two private subnets inside `prod-vpc`.

## Step 4: Create and Attach Internet Gateway

Created an Internet Gateway named `prod-igw` and attached it to `prod-vpc`.

Purpose:
The Internet Gateway enables internet connectivity for public-facing resources inside the VPC such as:
- Application Load Balancer
- NAT Gateway
- Public networking components

Subnet Configuration:
- private-subnet-a → 10.1.10.0/24
- private-subnet-b → 10.1.11.0/24

Both subnets were placed in separate Availability Zones for high availability.
Public IP auto-assignment was not enabled so these subnets remain private.

## Step 6: Configure Route Tables

Created:
- public-rt
- private-rt

Public Route Table:
- Associated with public subnets
- Configured route:
  - `0.0.0.0/0 -> Internet Gateway`

Private Route Table:
- Associated with private subnets
- Configured route:
  - `0.0.0.0/0 -> NAT Gateway`

Purpose:
- Public subnets provide internet-facing connectivity
- Private subnets securely access the internet through the NAT Gateway

- ## Step 7: Configure Session Manager Access

Created an IAM role named `prod-ssm-role` and attached the `AmazonSSMManagedInstanceCore` policy.

Also created an IAM instance profile named `prod-ssm-profile` for the private EC2 instance.

Purpose:
The IAM role and instance profile allow secure Systems Manager Session Manager access to private EC2 instances without requiring SSH or a public IP address.
Both subnets were placed in separate Availability Zones for high availability.
Public IP auto-assignment was not enabled so these subnets remain private.

## Step 8: Launch Private EC2 Application Server

Created a security group named `prod-private-app-sg` and used it for the private EC2 application server.

Security Group Rules:
- HTTP allowed from within the VPC
- Outbound traffic allowed

Launched a private EC2 instance named `prod-private-app-server`.

Configuration:
- VPC: prod-vpc
- Subnet: private-subnet-a
- Public IP: Disabled
- IAM Role: prod-ssm-role
- Security Group: prod-private-app-sg

Purpose:
The EC2 instance acts as the private backend application server within the multi-tier architecture.

## Step 9: Create Target Group

Created a Target Group named `prod-target-group`.

Configuration:
- Target Type: Instance
- Protocol: HTTP
- Port: 80
- VPC: prod-vpc

Registered:
- private-app-server

Purpose:
The Target Group acts as the backend destination for traffic forwarded from the Application Load Balancer.

## Step 10: Create Application Load Balancer

Created:
- Application Load Balancer (`prod-alb`)
- ALB Security Group (`prod-alb-sg`)

Configuration:
- Internet-facing ALB
- Deployed across public subnets
- Listener configured on HTTP port 80
- Default action forwards traffic to `prod-target-group`

Security:
- Backend EC2 only accepts HTTP traffic from the ALB security group

Purpose:
The ALB acts as the public entry point to the application while backend resources remain private and secure.

## Step 11: Create RDS Database

Created:
- DB Subnet Group (`prod-db-subnet-group`)
- Security Group (`prod-db-sg`)
- RDS Database (`prod-db`)

Configuration:
- VPC: prod-vpc
- DB Subnet Group: prod-db-subnet-group
- Public Access: No
- Security Group: prod-db-sg

Purpose:
The RDS database provides a private managed data layer for the multi-tier architecture.

## Step 12: Test the Full Architecture

Validated the complete Terraform-built multi-tier AWS architecture.

Checks completed:
- EC2 application server is running
- Apache responds locally using `curl localhost`
- Target group status is healthy
- Application Load Balancer DNS name serves the webpage
- RDS database is available and private

Result:
The public ALB successfully forwards traffic to the private EC2 application server, and the RDS database remains private inside the VPC.
 
