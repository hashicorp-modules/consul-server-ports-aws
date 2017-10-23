variable "environment" {
  description = "Environment name."
}

variable "vpc_cidr" {
  description = "VPC CIDR block."
}

variable "cidr_blocks" {
  type        = "list"
  description = "CIDR blocks for Security Groups."
}
