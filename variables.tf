# variables.tf

# Required variables

variable "docker_host" {
  type        = string
  description = "docker host URL"
}
variable "traefik_hostname" {
  type        = string
  description = "Hostname for accessing Traefik e.g. traefik.example.com"
}

variable "traefik_password" {
  type        = string
  description = "Password for accessing Traefik"
  default     = "traefik"
}

variable "vault_hostname" {
  type        = string
  description = "Hostname for accessing vault e.g. vault.example.com"
}
variable "acme_email" {
  type        = string
  description = "Let's Encrypt email address used for registration."
}