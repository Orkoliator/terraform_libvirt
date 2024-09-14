resource "libvirt_cloudinit_disk" "cloudinit" {
  name = "${var.libvirt_domain_name}_cloudinit.iso"
  pool = libvirt_pool.libvirt_pool.name
  user_data = <<EOF
#cloud-config
manage_etc_hosts: true
chpasswd:
  list: |
    root:${var.libvirt_cloudinit_password}
    ${var.libvirt_cloudinit_user}:${var.libvirt_cloudinit_password}
  expire: false
users:
  - name: ${var.libvirt_cloudinit_user}
    passwd: ${var.libvirt_cloudinit_password}
    lock_password: false
    group:
      - sudo
    sudo:
      - ALL=(ALL:ALL) ALL
    shell: /bin/bash
    ssh-authorized-keys:
      - ${jsonencode(trimspace(file("~/.ssh/id_rsa.pub")))} 
package_update: true
packages:
  - python3
manage_resolv_conf: true
resolv_conf:
  nameservers: ['8.8.4.4', '8.8.8.8']
EOF
}
