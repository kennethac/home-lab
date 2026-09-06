resource "proxmox_download_file" "debian_template" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.target_node
  url          = "http://download.proxmox.com/images/system/debian-13-standard_13.6-1_amd64.tar.zst"
}

# Create the Debian 13 LXC Container
resource "proxmox_virtual_environment_container" "debian_lxc" {
  depends_on = [proxmox_download_file.debian_template]

  node_name = var.target_node
  vm_id     = var.vm_id

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway  = var.ipv4_gateway
      }
    }

    user_account {
      keys = [trimspace(var.ssh_public_key)]
    }
  }

  operating_system {
    template_file_id = proxmox_download_file.debian_template.id
    type             = "debian"
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 256
  }

  disk {
    datastore_id = "local-lvm"
    size         = var.disk_size
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

output "lxc_ip" {
  value       = proxmox_virtual_environment_container.debian_lxc.initialization[0].ip_config[0].ipv4[0].address
  description = "IP address assigned to LXC container"
}