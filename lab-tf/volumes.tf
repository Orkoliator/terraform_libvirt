resource "libvirt_pool" "libvirt_pool" {
  name = var.libvirt_pool_name
  type = "dir"
  path = var.libvirt_pool_dir
}

resource "libvirt_volume" "libvirt_volume" {
  name = "${var.libvirt_domain_name}-${count.index}.qcow2"
  pool = libvirt_pool.libvirt_pool.name
  source = var.image_url
  format = "qcow2"
  count = var.domain_count
}

