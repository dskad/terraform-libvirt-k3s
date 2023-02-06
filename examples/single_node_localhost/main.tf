module "k3s_node" {
  source              = "../.."
  hostname            = var.hostname
  image_file          = var.img_file
  ssh_authorized_keys = var.ssh_authorized_keys
}
