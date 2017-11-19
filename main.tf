# https://www.consul.io/docs/agent/options.html#ports
module "consul_client_ports_aws" {
  source = "git@github.com:hashicorp-modules/consul-client-ports-aws?ref=f-refactor"

  provision   = "${var.provision}"
  name        = "${var.name}-consul-server"
  vpc_id      = "${var.vpc_id}"
  cidr_blocks = "${var.cidr_blocks}"
}

# Server RPC (Default 8300) - TCP. This is used by servers to handle incoming requests from other agents on TCP only.
resource "aws_security_group_rule" "server_rpc_tcp" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${module.consul_client_ports_aws.consul_client_sg_id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 8300
  to_port           = 8300
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# As of Consul 0.8, it is recommended to enable connection between servers through port 8302 for both
# TCP and UDP on the LAN interface as well for the WAN Join Flooding feature. See also: Consul 0.8.0
# CHANGELOG and GH-3058
# https://github.com/hashicorp/consul/blob/master/CHANGELOG.md#080-april-5-2017
# https://github.com/hashicorp/consul/issues/3058

# Serf WAN (Default 8302) - TCP. This is used by servers to gossip over the WAN to other servers on TCP and UDP.
resource "aws_security_group_rule" "serf_wan_tcp" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${module.consul_client_ports_aws.consul_client_sg_id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 8302
  to_port           = 8302
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# Serf WAN (Default 8302) - UDP. This is used by servers to gossip over the WAN to other servers on TCP and UDP.
resource "aws_security_group_rule" "serf_wan_udp" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${module.consul_client_ports_aws.consul_client_sg_id}"
  type              = "ingress"
  protocol          = "udp"
  from_port         = 8302
  to_port           = 8302
  cidr_blocks       = ["${var.cidr_blocks}"]
}
