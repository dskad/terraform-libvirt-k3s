variable "hostname" {
  type        = string
  description = "Host name of VM"
  default = "coreos"
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
  description = "uri connection strting for libvirt"
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
  description = "Nnumber of virtual CPUs"
  default     = 2
}

variable "host_volume_size" {
  type        = number
  description = "Size of VM volume in GB"
  default     = 80
}

# variable "hostname_format" {
#   type    = string
#   default = "coreos%02d"
# }

# CoreOS Channel (stable,testing,next)
# variable "coreos_channel" {
#   description = "CoreOS Channel (stable,testing,next)"
#   type        = string
#   default     = "testing"

#   validation {
#     condition     = contains(["stable", "testing", "next"], var.coreos_channel)
#     error_message = "The coreos_channel value must be one of 'stabe', 'testing', 'next'."
#   }
# }
