resource "snowflake_grant_ownership" "grant_ownerships" {
  for_each = var.grant_ownerships

  account_role_name   = each.value.account_role_name
  database_role_name  = each.value.database_role_name
  outbound_privileges = each.value.outbound_privileges

  on {
    dynamic "all" {
      for_each = each.value.on.all != null ? [each.value.on.all] : []
      content {
        in_database        = all.value.in_database
        in_schema          = all.value.in_schema
        object_type_plural = all.value.object_type_plural
      }
    }
    dynamic "future" {
      for_each = each.value.on.future != null ? [each.value.on.future] : []
      content {
        in_database        = future.value.in_database
        in_schema          = future.value.in_schema
        object_type_plural = future.value.object_type_plural
      }
    }
    object_name = each.value.on.object_name
    object_type = each.value.on.object_type
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

