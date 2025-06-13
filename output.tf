output "users_passwords" {
  description = "A map of user principal names to their generated passwords."
  value = {
    for user in var.users : user.upn => module.users_account_creation.users_passwords[user.upn]
  }
  sensitive = true
}