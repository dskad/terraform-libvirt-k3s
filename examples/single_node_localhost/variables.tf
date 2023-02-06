variable "img_file" {
  description = "CoreOS qcow2 image file"
  type        = string
}

variable "hostname" {
  description = "Hostname of the VM"
  type        = string
  default     = "coreos"
}

variable "ssh_authorized_keys" {
  description = "SSH authorized keys to be added to the core user"
  type        = list(string)
  default     = []
  sensitive   = true
}