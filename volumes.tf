# TODO #2 Create pool for volumes with libvirt module instead of hard coding to the default pool

# module "base_volume" {
#   source   = "./modules/base_image"
#   image_file = var.image_file
# }

locals {
  base_image_id = var.base_image == "" ? libvirt_volume.base_image[0].id : var.base_image
}

resource "libvirt_volume" "base_image" {
  name   = "base_image.qcow2"
  source = var.image_file
  count  = var.image_file != null ? 1 : 0
}

resource "libvirt_volume" "coreos_node" {
  name           = "${var.hostname}.qcow2"
  base_volume_id = local.base_image_id
  size           = var.host_volume_size * pow(1024, 3) # Size is in bytes, lets use GB instead!
  depends_on = [
    local.base_image_id
  ]
  lifecycle {
    # Note: this triggers the terraform 1.2 requirement
    # This will replace the VM's drive volume so that the ignition change
    #   can be applied to a clean install. Ignition only applies during
    #   initial startup
    replace_triggered_by = [
      libvirt_ignition.ignition.id
    ]
  }
}
