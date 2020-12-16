terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.13"
}

provider "docker" {
  # If connecting to a remote Docker host that requires private key authentication,
  # ensure the ~/.ssh/config file on the client machine running Terraform specifies the correct host/key for authentication
  # See - https://github.com/terraform-providers/terraform-provider-docker/issues/268
  host = var.docker_host
}

module "docker-traefik" {
  source = "github.com/colinwilson/terraform-docker-traefik-v2"

  traefik_network_attachable = true
  acme_email                 = var.acme_email
  hostname                   = var.traefik_hostname
}

module "docker-vault" {
  source = "github.com/colinwilson/terraform-docker-vault-dev"

  hostname = var.vault_hostname
  networks = [module.docker-traefik.traefik_network_name] # connect Vault container to the traefik network. Named via the Traefik module output

  depends_on = [
    module.docker-traefik
  ]
}