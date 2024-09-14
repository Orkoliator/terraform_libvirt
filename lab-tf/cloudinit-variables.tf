variable "libvirt_cloudinit_user" {
  description = "non-default user to be created on virtual machine"
  default = "lab-user"
}

variable "libvirt_cloudinit_password" {
  description = "password for non-default user"
  sensitive = true
}

