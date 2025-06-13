variable "tenant_id" {
  description = "The Tenant ID for Azure AD."
  type        = string
}

variable "user" {
    description = "The object ID of the user to add to the group."
    type        = string
}

variable "groups" {
    description = "List of groups to which the user will be added."
    type        = list(string)
}