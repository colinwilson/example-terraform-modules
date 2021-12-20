terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token

  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key
}

provider "kubernetes" {
  host                   = module.doks.endpoint
  token                  = module.doks.cluster_token
  cluster_ca_certificate = module.doks.ca_cert
}

provider "helm" {
  kubernetes {
    host                   = module.doks.endpoint
    token                  = module.doks.cluster_token
    cluster_ca_certificate = module.doks.ca_cert
  }
}

module "doks" {
  source = "github.com/aigisuk/terraform-digitalocean-doks"
}

module "harbor" {
  source = "github.com/colinwilson/terraform-digitalocean-doks-harbor"

  harbor_ext_url = var.harbor_ext_url

  doks_cluster_name = module.doks.cluster_name

  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key

  depends_on = [
    module.doks
  ]
}

# module "traefik" {
#   source = "github.com/aigisuk/terraform-kubernetes-traefik"
# }