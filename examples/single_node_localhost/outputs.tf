output "ip_addresses" {
  value = module.k3s_cluster_bootstrap_node.*.ip_addresses
}

output "hostnames" {
  value = module.k3s_cluster_bootstrap_node.*.hostname
}