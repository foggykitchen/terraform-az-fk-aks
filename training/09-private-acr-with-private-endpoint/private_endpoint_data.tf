locals {
  private_endpoint_nic_id = var.enable_acr_private_endpoint ? module.private_endpoint_acr[0].network_interface_ids[0].id : null
  private_endpoint_nic_rg = var.enable_acr_private_endpoint ? regex(".*/resourceGroups/([^/]+)/providers/.*", local.private_endpoint_nic_id)[0] : null
  private_endpoint_nic_name = var.enable_acr_private_endpoint ? element(
    split("/", local.private_endpoint_nic_id),
    length(split("/", local.private_endpoint_nic_id)) - 1
  ) : null
}

data "azurerm_network_interface" "private_endpoint" {
  count               = var.enable_acr_private_endpoint ? 1 : 0
  name                = local.private_endpoint_nic_name
  resource_group_name = local.private_endpoint_nic_rg

  depends_on = [
    module.private_endpoint_acr
  ]
}
