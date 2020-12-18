# outputs.tf
output "traefik_network_name" {
  value = module.docker-traefik.traefik_network_name
}
output "acme_mountpoint" {
  value = module.docker-traefik.acme_volume_mountpoint
}

output "traefik_service_config_name" {
  value = module.docker-traefik.traefik_service_config_name
}