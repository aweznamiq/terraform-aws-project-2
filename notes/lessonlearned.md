## Terraform Fundamentals Learnings

- Terraform creates infrastructure using code
- Providers allow Terraform to interact with cloud platforms
- Variables improve reusability and maintainability
- terraform plan previews infrastructure changes
- terraform apply deploys infrastructure automatically

## Public Subnet Learnings

- Public subnets are used for internet-facing AWS resources
- Multiple Availability Zones improve availability
- Auto-assign public IP is needed for public workloads
- Terraform makes subnet creation repeatable and consistent

## Private Subnet Learnings

- Private subnets isolate backend resources from direct internet access
- Private resources should not receive public IP addresses
- Multiple Availability Zones improve availability
- Terraform makes subnet creation repeatable and consistent

- ## Internet Gateway Learnings

- Internet Gateways connect AWS VPCs to the internet
- Public subnets require an Internet Gateway for internet communication
- Internet Gateways must be attached to a VPC before use
- Internet Gateways are foundational components of public AWS networking

- ## NAT Gateway Learnings

- NAT Gateways allow private subnet resources to access the internet securely
- Private resources remain inaccessible from inbound internet traffic
- Public NAT Gateways require an Elastic IP
- NAT Gateways must be deployed in public subnets
- NAT Gateways are key components in secure multi-tier AWS architectures

## Route Table Learnings

- Route tables control network traffic flow inside AWS VPCs
- Public subnets route internet traffic through Internet Gateways
- Private subnets route outbound traffic through NAT Gateways
- Route table associations determine subnet behavior
- Multi-tier architectures require separate routing strategies

- ## Session Manager Learnings

- Systems Manager Session Manager enables secure access to EC2 instances
- IAM instance profiles pass role permissions to EC2 instances
- AmazonSSMManagedInstanceCore is required for Session Manager access
- Private EC2 instances still need outbound HTTPS access to Systems Manager endpoints
- Session Manager removes the need for SSH keys and public management access

- ## Private EC2 Learnings

- Private EC2 instances should not have public IP addresses
- Security groups must be created before resources that reference them
- Session Manager provides secure administration without SSH
- User data can bootstrap Apache automatically
- Backend servers are commonly isolated in private subnets

## Target Group Learnings

- Target groups route traffic to registered backend targets
- Health checks determine whether targets are ready to receive traffic
- Listener rules forward requests to a target group
- A target group can be used by only one load balancer

- ## Application Load Balancer Learnings

- ALBs provide secure public access to private backend services
- Listener rules forward requests to target groups
- Backend EC2 instances can remain private behind an ALB
- ALBs distribute traffic across healthy targets
- Security groups can restrict backend access to ALB-only traffic

## RDS Learnings

- RDS databases can be deployed inside a VPC
- DB subnet groups should use private subnets
- A DB subnet group must span at least two Availability Zones
- Security groups control which trusted sources can reach the database
- Private databases should not be publicly accessible

- ## Final Terraform Project Learnings

- Terraform can build a complete AWS multi-tier architecture from code
- Target groups and listener rules are required for ALB traffic flow
- Session Manager provides secure access to private EC2 instances
- Private databases should remain inaccessible from the public internet
- Outputs help expose useful infrastructure values after deployment
- Infrastructure as Code makes cloud builds repeatable and consistent


# Final Terraform Learnings

- Terraform enables repeatable Infrastructure as Code workflows
- Infrastructure can be provisioned and destroyed automatically
- AWS networking can be fully automated
- Multi-tier architectures require careful dependency management
- Outputs improve infrastructure usability
- Terraform state tracks deployed resources
- Infrastructure automation reduces manual configuration effort

