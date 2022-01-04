# main.tf
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
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

data "digitalocean_kubernetes_cluster" "harbor_cluster" {
  name = var.doks_cluster_name
}

provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.harbor_cluster.endpoint
  token = data.digitalocean_kubernetes_cluster.harbor_cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.harbor_cluster.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host  = data.digitalocean_kubernetes_cluster.harbor_cluster.endpoint
    token = data.digitalocean_kubernetes_cluster.harbor_cluster.kube_config[0].token
    cluster_ca_certificate = base64decode(
      data.digitalocean_kubernetes_cluster.harbor_cluster.kube_config[0].cluster_ca_certificate
    )
  }
}


module "harbor" {
  source = "github.com/colinwilson/terraform-digitalocean-doks-harbor"

  doks_cluster_name = var.doks_cluster_name

  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key

  create_namespace              = var.create_namespace
  harbor_expose_type            = var.harbor_expose_type
  harbor_ext_url                = var.harbor_ext_url
  harbor_tls_secret_name        = var.harbor_tls_secret_name
  harbor_tls_notary_secret_name = var.harbor_tls_notary_secret_name

}

module "traefik" {
  source = "github.com/aigisuk/terraform-kubernetes-traefik"

  values_file = var.traefik_values_file
}