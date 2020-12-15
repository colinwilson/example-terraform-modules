# variables.tf

# Required variables
variable "hostname" {
  type        = string
  description = "Hostname for accessing Traefik e.g. traefik.example.com"
}
variable "acme_email" {
  type        = string
  description = "Let's Encrypt email address used for registration."
}