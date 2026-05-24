variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "prod"
}
variable "public_subnet_a_cidr" {
  type        = string
  description = "CIDR block for public subnet A"
  default     = "10.1.1.0/24"
}

variable "public_subnet_b_cidr" {
  type        = string
  description = "CIDR block for public subnet B"
  default     = "10.1.2.0/24"
}
variable "private_subnet_a_cidr" {
  type        = string
  description = "CIDR block for private subnet A"
  default     = "10.1.10.0/24"
}

variable "private_subnet_b_cidr" {
  type        = string
  description = "CIDR block for private subnet B"
  default     = "10.1.11.0/24"
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}
variable "db_username" {
  type        = string
  description = "Master username for the RDS database"
}

variable "db_password" {
  type        = string
  description = "Master password for the RDS database"
  sensitive   = true
}