terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">=3.2.1"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.111.1"
    }
  }
}