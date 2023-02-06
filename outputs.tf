output "ip_addresses" {
  value = libvirt_domain.coreos.network_interface.0.addresses
}

output "hostname" {
  value = var.hostname
}

output "base_image" {
  value = one(libvirt_volume.base_image[*].id)
}