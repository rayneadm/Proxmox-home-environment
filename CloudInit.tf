
provider "proxmox" {
  pm_api_url      = var.pvenode
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "debcitest" {
  count = var.instance_count
  name = "debvm-${count.index}"
  vmid = 400 + count.index
  desc        = "Test-cloud-init"
  target_node = "gtr"
  clone       = "d12-0"
  pool        = "Tests-Labs"
  disk {
    storage = "local"
    size    = "12G"
    type    = "scsi"
  }
  cores   = 1
  sockets = 1
  memory  = 4096

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  os_type         = "cloud-init"
  ssh_user        = "root"
  ssh_private_key = var.sshkeys

  provisioner "file" {
    source      = "./interfaces.tmpl"
    destination = "/etc/network/interfaces"
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("~/.ssh/id_ed25519")
      host        = "${var.ip_start + count.index}"
    }
  }
}

