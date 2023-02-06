resource "random_pet" "random_image_name" {
  keepers = {
    "image_id" = "var.image_file"
  }
}

resource "libvirt_volume" "volume" {
  name   = "${libvirt_volume_name}.qcow2"
  source = var.image_file
}
