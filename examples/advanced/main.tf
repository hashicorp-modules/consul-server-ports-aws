resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "${var.name}"
  }
}

module "consul_server_ports_aws" {
  source = "../../../consul-server-ports-aws"
  # source = "git@github.com:hashicorp-modules/consul-server-ports-aws?ref=f-refactor"

  name        = "${var.name}"
  vpc_id      = "${aws_vpc.main.id}"
  cidr_blocks = ["${var.cidr_blocks}"]
}
