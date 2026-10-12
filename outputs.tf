output "grant_ownerships_id" {
  description = "Map of id values across all grant_ownerships, keyed the same as var.grant_ownerships except keys with no id are omitted"
  value       = { for k, v in snowflake_grant_ownership.grant_ownerships : k => v.id if v.id != null && length(v.id) > 0 }
}
output "grant_ownerships_account_role_name" {
  description = "Map of account_role_name values across all grant_ownerships, keyed the same as var.grant_ownerships except keys with no account_role_name are omitted"
  value       = { for k, v in snowflake_grant_ownership.grant_ownerships : k => v.account_role_name if v.account_role_name != null && length(v.account_role_name) > 0 }
}
output "grant_ownerships_database_role_name" {
  description = "Map of database_role_name values across all grant_ownerships, keyed the same as var.grant_ownerships except keys with no database_role_name are omitted"
  value       = { for k, v in snowflake_grant_ownership.grant_ownerships : k => v.database_role_name if v.database_role_name != null && length(v.database_role_name) > 0 }
}
output "grant_ownerships_on" {
  description = "Map of on values across all grant_ownerships, keyed the same as var.grant_ownerships except keys with no on are omitted"
  value       = { for k, v in snowflake_grant_ownership.grant_ownerships : k => one(v.on) if v.on != null && length(v.on) > 0 }
}
output "grant_ownerships_outbound_privileges" {
  description = "Map of outbound_privileges values across all grant_ownerships, keyed the same as var.grant_ownerships except keys with no outbound_privileges are omitted"
  value       = { for k, v in snowflake_grant_ownership.grant_ownerships : k => v.outbound_privileges if v.outbound_privileges != null && length(v.outbound_privileges) > 0 }
}

