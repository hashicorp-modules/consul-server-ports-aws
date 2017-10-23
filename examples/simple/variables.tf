variable "environment" {
  description = "Environment name."
}

variable "vpc_cidr" {
  default     = "10.139.0.0/16"
  description = "VPC CIDR block."
}
