module "users_account_creation" {
  source = "./modules/Accounts"

  tenant_id = var.tenant_id
  users     = var.users
}