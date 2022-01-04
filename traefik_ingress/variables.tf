# variables.tf

# Required variables

variable "do_token" {}
variable "spaces_access_id" {}
variable "spaces_secret_key" {}
variable "doks_cluster_name" {}

# Optional variable

variable "create_namespace" {}

variable "harbor_ext_url" {}
variable "harbor_expose_type" {}
variable "harbor_tls_secret_name" {}
variable "harbor_tls_notary_secret_name" {}

variable "traefik_values_file" {}