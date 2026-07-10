module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "storage_account" {
  source              = "./modules/storage_account"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = local.common_tags
}

module "vnet" {
  source              = "./modules/vnet"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  address_space       = var.vnet_address_space
  vm_subnet_prefixes  = var.vm_subnet_prefixes
  tags                = local.common_tags
}

module "nsg" {
  source              = "./modules/nsg"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = local.common_tags
}

module "public_ip" {
  source              = "./modules/public_ip"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = local.common_tags
}

module "nic" {
  source              = "./modules/nic"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  subnet_id           = module.vnet.vm_subnet_id
  public_ip_id        = module.public_ip.id
  nsg_id              = module.nsg.id
  tags                = local.common_tags
}

module "linux_vm" {
  source              = "./modules/linux_vm"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  nic_id              = module.nic.id
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  vm_size             = var.vm_size
  tags                = local.common_tags
}