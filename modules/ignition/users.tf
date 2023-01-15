#TODO make this accept multiple users from variable array
data "ignition_user" "core" {
  name                = "core"
  ssh_authorized_keys = var.ssh_authorized_keys
}