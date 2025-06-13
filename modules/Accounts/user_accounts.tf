resource "azuread_user" "users" {
  for_each              = { for user in var.users : user.upn => user }
  account_enabled       = each.value.account_enabled
  user_principal_name   = each.value.upn
  display_name          = "${each.value.first_name} ${each.value.last_name} ${each.value.company}"
  given_name            = each.value.first_name
  surname               = each.value.last_name
  mail                  = "${lower(each.value.first_name)}.${lower(each.value.last_name)}@${each.value.domain}"
  company_name          = each.value.company
  job_title             = each.value.job_title
  division = each.value.division
  employee_id = each.value.employee_id
  employee_type = each.value.employee_type
  street_address = each.value.address
  city = each.value.city
  country = each.value.country
  mobile_phone = each.value.mobile_phone
  password              = random_password.passwords[each.key].result
  force_password_change = true
}

resource "random_password" "passwords" {
  for_each = { for user in var.users : user.upn => user }
  length   = 16
  special  = true
  lower    = true
  upper    = true
  numeric  = true
}