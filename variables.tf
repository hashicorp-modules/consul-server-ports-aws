variable "name" {
  default     = "consul-server-ports-aws"
  description = "Name for resources, defaults to \"consul-server-ports-aws\"."
}

variable "vpc_id" {
  description = "VPC ID to provision resources in."
}

variable "cidr_blocks" {
  type        = "list"
  description = "CIDR blocks for Security Groups."
}
