
provider "proxmox" {
  pm_api_url        = "https://pve.gh.rayne.ru:8006/api2/json"
  pm_tls_insecure   = true
}

resource "proxmox_lxc" "advanced_features" {
  vmid              = "3001" 
  target_node       = "gtr"
  pool              = "Tests-Labs"
  hostname          = "lxc-u23.1"
  description       = "Test ubuntu 23.10 LXC"
  ostemplate        = "Media:vztmpl/ubuntu-23.10-standard_23.10-1_amd64.tar.zst"
  unprivileged      = true
  cores             = 1
  cpulimit          = 2
  memory            = 1024
  swap              = 512
  onboot            = true
  start             = true
  ssh_public_keys   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/xEu2X/rTofe8ofiJXv6E+B6qW/Ru1zriBG7VsjYKC rayne@mail.ru"
  // Terraform will crash without rootfs defined
  rootfs {
    storage         = "local"
    size            = "8G"
  }

  network {
    name            = "eth0"
    bridge          = "vmbr0"
    ip              = "192.168.1.141/24"
    gw              = "192.168.1.1"
    ip6             = "auto"
  }
}
