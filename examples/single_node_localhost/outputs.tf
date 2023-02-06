output "ip_addresses" {
  description = "IP addresses of the k3s node"
  value       = module.k3s_node.*.ip_addresses
}

output "hostnames" {
  description = "Hostname of the k3s node"
  value       = module.k3s_node.*.hostname
}