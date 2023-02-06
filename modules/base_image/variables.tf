variable "image_file" {
  description = "Source qcow2 image file to use as base volume for VM hosts."
  type        = string
  default     = ""
}

variable "libvirt_volume_name" {
  description = "Name of the volume file once imported into libvirt"
  type = string
  default = "base-volume-${random_pet.random_image_name.id}"
}