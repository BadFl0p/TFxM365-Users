variable "tenant_id" {
  description = "The Tenant ID for Azure AD."
  type        = string
}

variable "users" {
  description = "List of Azure AD users."
  type = map(object({
    account_enabled = bool # Whether the user account is enabled
    display_name    = string
    first_name      = string
    last_name       = string
    company         = string # Company name for the user
    upn             = string # Same as user email
    job_title       = string # Job title of the user
    division        = string # Division of the user
    employee_id     = string # Employee ID of the user
    employee_type   = string # Employee type of the user
    address         = string # Street address of the user
    city            = string # City of the user
    country         = string # Country of the user
    mobile_phone    = string # Mobile phone number of the user
    domain          = string # Domain name for the user email
    groups = optional(list(string), []) # Groups to which the user belongs
    # licenses = optional(list(string), []) # List of licenses assigned to the user
    # administrative_unit = string # Administrative unit to which the user belongs
  }))

  validation {
    condition = alltrue([
      for user in var.users : can(regex("^[A-Z][a-z]+$", user.first_name))
    ])
    error_message = "first_name must start with an uppercase letter followed by lowercase letters only, without accents."
  }

  validation {
    condition = alltrue([
      for user in var.users : can(regex("^[A-Z]+$", user.last_name))
    ])
    error_message = "last_name must be all uppercase letters without accents."
  }
}