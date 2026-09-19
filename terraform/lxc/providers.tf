
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.111.1"
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