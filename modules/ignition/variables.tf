variable "ssh_authorized_keys" {
  type        = list(string)
  description = "SSH authorized keys to be added to the core user"
  validation {
    condition     = length(var.ssh_authorized_keys) > 0
    error_message = "The ssh_authorized_keys value must be set"
  }
  sensitive = true
}

variable "hostname" {
  type = string
  description = "VM host name"
  validation {
    condition = length(var.hostname) > 0
    error_message = "The hostname must be set"
  }
}

variable "k3s_install_options" {
  type        = map(string)
  description = "Install options to pass to k3s-install.sh"
  default = {}
}
