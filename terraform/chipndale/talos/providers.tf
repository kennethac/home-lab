terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.111.1"
    }
    talos = {
      source  = "siderolabs/talos"
      version = ">=0.11.0"
    }
    http = {
        source  = "hashicorp/http"
        version = ">=3.4.5"
    }
  }
}