variable "tenant_id" {
  description = "The Tenant ID for Azure AD."
  type        = string
}

variable "users" {
  description = "List of Azure AD users."
  type = map(object({
    account_enabled = bool # Whether the user account is enabled
    display_name = string
    first_name   = string
    last_name    = string
    email        = string # This is the primary email for the user
    company      = string # Company name for the user
    upn          = string # Same as user email
    job_title    = string # Job title of the user
    division     = string # Division of the user
    employee_id  = string # Employee ID of the user
    employee_type = string # Employee type of the user
    address      = string # Street address of the user
    city         = string # City of the user
    country      = string # Country of the user
    mobile_phone = string # Mobile phone number of the user
    # licenses = optional(list(string), []) # List of licenses assigned to the user
    # administrative_unit = string # Administrative unit to which the user belongs
    # groups = optional(list(string), []) # Groups to which the user belongs
  }))
}
