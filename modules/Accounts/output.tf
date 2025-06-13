output "users_passwords" {
  description = "Map of user principal names to their generated passwords."
  value       = { for user, user_resource in azuread_user.users : user_resource.user_principal_name => random_password.passwords[user_resource.user_principal_name].result }
  sensitive = true
}