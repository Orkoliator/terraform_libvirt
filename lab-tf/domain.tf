resource "libvirt_domain" "libvirt_domain" {
  name = "${var.libvirt_domain_name}-${count.index}"
  memory = 2048
  vcpu = 1

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  network_interface {
    network_name = libvirt_network.libvirt_network.name
    wait_for_lease = true
    hostname = "${var.libvirt_domain_name}-${count.index}"
  }

  console {
    type = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type = "pty"
    target_port = "1"
    target_type = "virtio"
  }

  disk {
    volume_id = libvirt_volume.libvirt_volume[count.index].id
  }

  count = var.domain_count
}
