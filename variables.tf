# variables.tf

# Required variables
variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
}

# Optional variables
//variable "ssh_public_key_name" {}
//variable "server" {}
//variable "volume_size" {}
//variable "volume_filesystem" {}