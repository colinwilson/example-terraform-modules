# main.tf
terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

module "hcloud-docker-host" {
  source = "github.com/colinwilson/terraform-hcloud-docker-host"

  ssh_public_key      = var.ssh_public_key
  //server              = var.server
  //ssh_public_key_name = var.ssh_public_key_name
  //volume_size         = var.volume_size
  //volume_filesystem   = var.volume_filesystem

}