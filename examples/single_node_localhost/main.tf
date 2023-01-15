

module "k3s_cluster_bootstrap_node" {
  source              = "./modules/coreos_vm"
  hostname            = "k8scp_0"
  img_file            = var.img_file
  ssh_authorized_keys = var.ssh_authorized_keys
}

# module "k3s_contorl_plane" {
#   source = "./modules/vm"
#   hostname = "k9scp_1"
#   img_file = var.img_file
#   ssh_authorized_keys = var.ssh_authorized_keys
# }

