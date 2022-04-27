terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # path to your kubeconfig file
  }
}

module "traefik" {
  source = "aigisuk/traefik/kubernetes"

  values_file = var.traefik_values_file
}