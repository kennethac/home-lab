variable "cloudflare_api_token" {
  type = string
}

variable "kennethchristensen_me_zone_id" {
    type = string
}

variable "technitium_api_token" {
  description = "Technitium API token"
  type        = string
  sensitive   = true
}

variable "technitium_endpoint" {
  description = "Technitium API endpoint"
  type        = string
}