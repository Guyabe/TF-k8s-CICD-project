variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region where resources will be deployed"
}v

ariable "availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
  description = "The Project AZs"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "environment" {
  default     = "dev"
  description = "Environment (dev, staging, prod)"
}

variable "vpc_name" {
  default     = "final-vpc"
  description = "The Project VPC name"
}

variable "project_name" {
  default     = "final-project"
  description = "The Project VPC name"
}