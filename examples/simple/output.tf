output "consul_server_sg_id" {
  value = "${module.consul_server_ports_aws.consul_server_sg_id}"
}
