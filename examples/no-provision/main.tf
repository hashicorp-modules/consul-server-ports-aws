module "consul_server_ports_aws" {
  source = "../../../consul-server-ports-aws"
  # source = "git@github.com:hashicorp-modules/consul-server-ports-aws?ref=f-refactor"

  count       = "0"
  vpc_id      = "1234"
  cidr_blocks = ["10.139.0.0/16"]
}
