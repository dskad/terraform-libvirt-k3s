output "base_volume" {
  value = libvirt_volume.volume
  description = "Base volume. VMs extend this volume to save space"
}
