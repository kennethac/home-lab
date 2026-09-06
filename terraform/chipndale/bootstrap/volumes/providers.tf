terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 3.2.1"
    }
    restapi = {
      source  = "Mastercard/restapi"
      version = ">= 3.0.0"
    }
  }
}
