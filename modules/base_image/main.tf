resource "libvirt_volume" "coreos_base" {
  name   = "coreos_base.qcow2"
  source = var.img_file
}
