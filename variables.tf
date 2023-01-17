variable "hostname" {
  type        = string
  description = "Host name of VM"
  default     = "coreos"
}

variable "img_file" {
  description = "CoreOS qcow2 image file"
  type        = string
  default     = ""
}

variable "ssh_authorized_keys" {
  type        = list(string)
  description = "SSH authorized keys to be added to the core user"
  validation {
    condition     = length(var.ssh_authorized_keys) > 0
    error_message = "The ssh_authorized_keys value must be set"
  }
  sensitive = true
}

variable "libvirt_uri" {
  description = "uri connection string for libvirt"
  type        = string
  default     = "qemu:///system"
}

variable "vmem" {
  type        = number
  description = "Virtual RAM in MB"
  default     = 4096
}

variable "vcpu" {
  type        = number
  description = "Number of virtual CPUs"
  default     = 2
}

variable "host_volume_size" {
  type        = number
  description = "Size of VM volume in GB"
  default     = 80
}

variable "k3s_install_options" {
  type        = map(string)
  description = "Install options to pass to k3s-install.sh"
  default     = {}
}