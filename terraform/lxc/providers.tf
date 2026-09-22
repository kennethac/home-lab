
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.111.1"
    }
    technitium = {
      source  = "darkhonor/technitium"
      version = "1.2.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox.endpoint
  insecure = var.proxmox.insecure

  username = var.proxmox.username
  password = var.proxmox.password
  ssh {
    agent    = true
    username = var.proxmox.username
  }
}

provider "technitium" {
  server_url = "http://${substr(var.technitium_dale.ipv4_address, 0, length(var.technitium_dale.ipv4_address) - 3)}:5380"
  api_token  = var.technitium_api_token
}