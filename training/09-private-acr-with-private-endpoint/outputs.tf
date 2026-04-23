output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "acr_name" {
  value = module.acr.acr_name
}

output "acr_id" {
  value = module.acr.acr_id
}

output "cluster_name" {
  value = module.aks.cluster_name
}

output "acr_pull_role_assignment_id" {
  value = module.acr_pull.role_assignment_id
}

output "acr_private_endpoint_ip" {
  value = var.enable_acr_private_endpoint && length(data.azurerm_network_interface.private_endpoint[0].ip_configuration) > 0 ? data.azurerm_network_interface.private_endpoint[0].ip_configuration[0].private_ip_address : null
}
