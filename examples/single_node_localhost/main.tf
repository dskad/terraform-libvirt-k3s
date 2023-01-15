module "k3s_node" {
  source              = "../.."
  hostname            = var.hostname
  img_file            = var.img_file
  ssh_authorized_keys = var.ssh_authorized_keys
}
