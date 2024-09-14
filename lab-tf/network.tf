resource "libvirt_network" "libvirt_network" {
  name = "${var.libvirt_domain_name}-nat"
  mode = "nat"
  addresses = var.libvirt_network_addresses
  dhcp {
    enabled = true
  }
  dns {
    enabled = true
  }
}
