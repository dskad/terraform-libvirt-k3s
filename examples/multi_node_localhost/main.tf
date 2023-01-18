module "k3s_bootstrap_node" {
  source              = "../.."
  hostname            = "cpnode00"
  img_file            = var.img_file
  ssh_authorized_keys = var.ssh_authorized_keys
  k3s_install_options = {
    "INSTALL_K3S_EXEC" = "server --cluster-init --token supersecrettoken",
  }
  vmem = 2048
  vcpu = 1
}

module "k3s_control_plane" {
  source              = "../.."
  hostname            = format("cpnode%02d", count.index + 1)
  img_file            = var.img_file
  ssh_authorized_keys = var.ssh_authorized_keys
  k3s_install_options = {
    "INSTALL_K3S_EXEC" = "server --server https://${module.k3s_bootstrap_node.hostname}:6443 --token supersecrettoken",
  }
  count = 2
  depends_on = [
    module.k3s_bootstrap_node
  ]
  vmem = 2048
  vcpu = 1
}

module "k3s_worker_nodes" {
  source              = "../.."
  hostname            = format("workernode%02d", count.index)
  img_file            = var.img_file
  ssh_authorized_keys = var.ssh_authorized_keys
  k3s_install_options = {
    "INSTALL_K3S_EXEC" = "agent --server https://${module.k3s_bootstrap_node.hostname}:6443 --token supersecrettoken",
  }
  count = 3
  depends_on = [
    module.k3s_bootstrap_node
  ]
  vcpu = 1
}