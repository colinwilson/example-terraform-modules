# outputs.tf
output "server_ip" {
  description = "Docker Host IP address"
  value       = module.hcloud-docker-host.ipv4_address
}

output "volume_size" {
  description = "Size of provisioned Cloud Volume"
  value       = module.hcloud-docker-host.volume_size
}

output "volume_mount_point" {
  description = "Mountpoint of provisioned Cloud Volume"
  value       = module.hcloud-docker-host.volume_mount_point
}