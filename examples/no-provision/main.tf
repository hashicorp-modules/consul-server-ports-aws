module "consul_server_ports_aws" {
  # source = "github.com/hashicorp-modules/consul-server-ports-aws?ref=f-refactor"
  source = "../../../consul-server-ports-aws"

  count       = "0"
  vpc_id      = "1234"
  cidr_blocks = ["10.139.0.0/16"]
}
