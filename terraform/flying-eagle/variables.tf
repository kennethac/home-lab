
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

variable "target_node" {
  description = "Target Proxmox node for the LXC container"
  type        = string
}

variable "vm_id" {
  description = "VM ID for the LXC container"
  type        = number
}

variable "hostname" {
  description = "Hostname for the LXC container"
  type        = string
}

variable "ipv4_address" {
  description = "IPv4 address for the LXC container"
  type        = string
}

variable "ipv4_gateway" {
  description = "IPv4 gateway for the LXC container"
  type        = string
}

variable "disk_size" {
  description = "Disk size for the LXC container"
  type        = number
}

variable "ssh_public_key" {
  description = "SSH public key for the LXC container"
  type        = string
}