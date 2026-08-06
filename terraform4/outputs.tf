output "rackula_url" {
  description = "Working URL to access Rackula"
  value       = "http://${module.rackula_server.public_ip}:8080"
}

output "instance_id" {
  description = "EC2 instance (server) ID"
  value       = module.rackula_server.id
}

output "ssm_command" {
  description = "SSM Session Manager command to connect to the server"
  value       = "aws ssm start-session --target ${module.rackula_server.id} --region ap-southeast-1"
}
