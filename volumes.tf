resource "libvirt_volume" "coreos_base" {
  name   = "coreos_base.qcow2"
  source = var.img_file
}

resource "libvirt_volume" "coreos_node" {
  name           = "${var.hostname}.qcow2"
  base_volume_id = libvirt_volume.coreos_base.id
  size           = var.host_volume_size * pow(1024,3) # Size is in bytes
}
