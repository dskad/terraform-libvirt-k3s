data "ignition_config" "k3s_ignition_config" {
  systemd = [
    data.ignition_systemd_unit.qemu_ga.rendered,
    data.ignition_systemd_unit.k3s_install.rendered
  ]

  files = [
    data.ignition_file.hostname.rendered,
    data.ignition_file.silence_audit_messages.rendered,
    data.ignition_file.k3s_install_script.rendered
  ]

  users = [
    data.ignition_user.core.rendered
  ]
}
