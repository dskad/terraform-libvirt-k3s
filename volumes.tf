# TODO #2 Create pool for volumes with libvirt module instead of hard coding to the default pool
module "coreos_base_volume" {
  source = "./modules/base_image"
  img_file = var.img_file
}

resource "libvirt_volume" "coreos_node" {
  name           = "${var.hostname}.qcow2"
  base_volume_id = module.coreos_base_volume.base_volume.id
  size           = var.host_volume_size * pow(1024, 3) # Size is in bytes
  depends_on = [
    module.coreos_base_volume
  ]
  lifecycle {
    # Note: this triggers the terraform 1.2 requirement
    # This will replace the VM's drive volume so that the ignition change
    #   can be applied to a clean install
    replace_triggered_by = [
      libvirt_ignition.ignition.id
    ]
  }
}
