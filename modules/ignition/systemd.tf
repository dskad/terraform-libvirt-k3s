data "ignition_systemd_unit" "k3s_install" {
  name = "k3s-install.service"
  depends_on = [
    data.ignition_file.k3s_install_script
  ]
  content = templatefile("${path.module}/files/units/k3s-install.service.tftpl",
    { env_config = var.k3s_install_options }
  )
}

data "ignition_systemd_unit" "qemu_ga" {
  name    = "qemu-ga-install.service"
  content = file("${path.module}/files/units/qemu-ga.service")
}