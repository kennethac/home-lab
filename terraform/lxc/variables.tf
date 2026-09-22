
variable "proxmox" {
  description = "Proxmox provider configuration"
  type = object({
    name         = string
    cluster_name = string
    endpoint     = string
    insecure     = bool
    username     = string
    password     = string
  })
}

variable "nodes" {
  type = set(string)
}

variable "flying-eagle" {
  description = "Configuration for the flying-eagle LXC container"
  type = object({
    target_node  = string
    vm_id        = number
    hostname     = string
    ipv4_address = string
    disk_size    = number
  })
}

variable "technitium_chip" {
  description = "Configuration for the technitium-chip LXC container"
  type = object({
    target_node  = string
    vm_id        = number
    hostname     = string
    ipv4_address = string
    ipv6_address = string
    disk_size    = number
  })
}

variable "technitium_dale" {
  description = "Configuration for the technitium-dale LXC container"
  type = object({
    target_node  = string
    vm_id        = number
    hostname     = string
    ipv4_address = string
    ipv6_address = string
    disk_size    = number
  })
}

variable "technitium_api_token" {
  description = "Technitium API token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "SSH public key for the LXC containers"
  type        = string
}

variable "ipv4_gateway" {
  description = "IPv4 gateway for the LXC containers"
  type        = string
}