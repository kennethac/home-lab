terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
    technitium = {
      source  = "darkhonor/technitium"
      version = "1.2.1"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "technitium" {
  server_url = var.technitium_endpoint
  api_token  = var.technitium_api_token
}