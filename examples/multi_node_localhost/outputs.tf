output "bootstrap_node_ip" {
  description = "IP addresses of the initial k3s node"
  value       = module.k3s_bootstrap_node.ip_addresses
}

output "bootstrap_node_hostname" {
  description = "Hostname of the k3s node"
  value       = module.k3s_bootstrap_node.hostname
}

output "k3s_control_plane_nodes_ip" {
  description = "IP address of the second node"
  value       = module.k3s_control_plane[*].ip_addresses
}

output "k3s_control_plane_nodes_hostname" {
  description = "IP address of the second node"
  value       = module.k3s_control_plane[*].ip_addresses
}
