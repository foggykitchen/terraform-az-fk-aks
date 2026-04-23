module "aks" {
  source = "../.."

  name                = var.aks_name
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name

  network_plugin = "azure"
  vnet_id        = module.vnet.vnet_id
  subnet_id      = module.vnet.subnet_ids["fk-subnet-aks"]

  default_node_count   = 2
  default_node_vm_size = "Standard_D2s_v3"

  tags = var.tags
}
