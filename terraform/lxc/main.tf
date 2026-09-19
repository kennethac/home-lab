resource "proxmox_download_file" "debian_template" {
  for_each = var.nodes
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = each.value
  url          = "http://download.proxmox.com/images/system/debian-13-standard_13.6-1_amd64.tar.zst"
}

moved {
  from = proxmox_virtual_environment_container.debian_lxc
  to   = proxmox_virtual_environment_container.flying_eagle
}

resource "proxmox_virtual_environment_container" "flying_eagle" {
  depends_on = [proxmox_download_file.debian_template]

  node_name = var.flying-eagle.target_node
  vm_id     = var.flying-eagle.vm_id

  lifecycle {
    prevent_destroy = true
    ignore_changes = [ operating_system[0].template_file_id ]
  }

  initialization {
    hostname = var.flying-eagle.hostname

    ip_config {
      ipv4 {
        address = var.flying-eagle.ipv4_address
        gateway  = var.ipv4_gateway
      }
    }

    user_account {
      keys = [trimspace(var.ssh_public_key)]
    }
  }

  operating_system {
    template_file_id = proxmox_download_file.debian_template[var.flying-eagle.target_node].id
    type             = "debian"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 1024
  }

  disk {
    datastore_id = "local-lvm"
    size         = var.flying-eagle.disk_size
  }

  network_interface {
    name = "eth0"
  }

  # Required for Tailscale TUN interface access
  features {
    nesting = true
  }

  unprivileged = true

  device_passthrough {
    path = "/dev/net/tun"
  }
}

output "flying_eagle_ip" {
  value       = proxmox_virtual_environment_container.flying_eagle.initialization[0].ip_config[0].ipv4[0].address
  description = "IP address assigned to flying-eagle container"
}

resource "proxmox_virtual_environment_container" "technitium_chip" {
  depends_on = [proxmox_download_file.debian_template]

  lifecycle {
    prevent_destroy = true
    ignore_changes = [ operating_system[0].template_file_id ]
  }

  node_name = var.technitium_chip.target_node
  vm_id     = var.technitium_chip.vm_id

  initialization {
    hostname = var.technitium_chip.hostname

    ip_config {
      ipv4 {
        address = var.technitium_chip.ipv4_address
        gateway  = var.ipv4_gateway
      }

      ipv6 {
        address = var.technitium_chip.ipv6_address
      }
    }

    user_account {
      keys = [trimspace(var.ssh_public_key)]
    }
  }

  operating_system {
    template_file_id = proxmox_download_file.debian_template[var.technitium_chip.target_node].id
    type             = "debian"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 1024
  }

  disk {
    datastore_id = "local-lvm"
    size         = var.technitium_chip.disk_size
  }

  network_interface {
    name = "eth0"
  }

  unprivileged = true

  features {
    nesting = true
  }
}

resource "proxmox_virtual_environment_container" "technitium_dale" {
  depends_on = [proxmox_download_file.debian_template]

  lifecycle {
    prevent_destroy = true
    ignore_changes = [ operating_system[0].template_file_id ]
  }

  node_name = var.technitium_dale.target_node
  vm_id     = var.technitium_dale.vm_id

  initialization {
    hostname = var.technitium_dale.hostname

    ip_config {
      ipv4 {
        address = var.technitium_dale.ipv4_address
        gateway  = var.ipv4_gateway
      }
      ipv6 {
        address = var.technitium_dale.ipv6_address
      }
    }

    user_account {
      keys = [trimspace(var.ssh_public_key)]
    }
  }

  operating_system {
    template_file_id = proxmox_download_file.debian_template[var.technitium_dale.target_node].id
    type             = "debian"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 1024
  }

  disk {
    datastore_id = "local-lvm"
    size         = var.technitium_dale.disk_size
  }

  network_interface {
    name = "eth0"
  }

  unprivileged = true

  features {
    nesting = true
  }
}