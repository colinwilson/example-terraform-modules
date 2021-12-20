output "cluster_id" {
  value = module.doks.cluster_id
}

output "cluster_vpc" {
  value = module.doks.cluster_vpc
}

output "cluster_subnet" {
  value = module.doks.cluster_subnet
}

output "service_subnet" {
  value = module.doks.service_subnet
}

output "endpoint" {
  value = module.doks.endpoint
}

output "ca_cert" {
  value     = module.doks.ca_cert
  sensitive = true
}