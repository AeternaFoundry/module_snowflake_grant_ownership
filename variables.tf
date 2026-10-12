variable "grant_ownerships" {
  description = <<EOT
Map of grant_ownerships, attributes below
Required:
    - on (block):
        - all (optional, block):
            - in_database (optional)
            - in_schema (optional)
            - object_type_plural (required)
        - future (optional, block):
            - in_database (optional)
            - in_schema (optional)
            - object_type_plural (required)
        - object_name (optional)
        - object_type (optional)
Optional:
    - account_role_name
    - database_role_name
    - outbound_privileges
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    account_role_name   = optional(string)
    database_role_name  = optional(string)
    outbound_privileges = optional(string)
    on = object({
      all = optional(object({
        in_database        = optional(string)
        in_schema          = optional(string)
        object_type_plural = string
      }))
      future = optional(object({
        in_database        = optional(string)
        in_schema          = optional(string)
        object_type_plural = string
      }))
      object_name = optional(string)
      object_type = optional(string)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
}

