variable "domain_count" {
  description = "number of virtual machines need to be deployed"
  default = 2
}

variable "libvirt_network_addresses" {
  description = "network address pool for virtual machines"
  default = ["192.168.42.0/24"]
}

variable "libvirt_pool_name" {
  description = "name of libvirt pool"
  default = "cluster"
}

variable "libvirt_pool_dir" {
  description = "directory of libvirt storage"
  default = "/home/lab-user/cluster"
}

variable "image_url" {
  description = "url of image that should be uploaded to storage pool"
  default = "https://releases.ubuntu.com/24.04.1/ubuntu-24.04.1-live-server-amd64.iso"
}

variable "libvirt_domain_name" {
  description = "static part of virtual machine name"
  default = "vm-host"
}
