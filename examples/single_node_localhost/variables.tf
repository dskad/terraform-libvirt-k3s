variable "img_file" {
  description = "CoreOS qcow2 image file"
  type        = string
}

variable "ssh_authorized_keys" {
  type        = list(string)
  description = "SSH authorized keys to be added to the core user"
  default     = []
  sensitive   = true
}