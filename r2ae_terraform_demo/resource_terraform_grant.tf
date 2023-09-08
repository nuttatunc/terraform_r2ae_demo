resource "snowflake_role" "role" {
  name = "DBT_ROLE_TERRAFORM"
}

resource "snowflake_user" "user" {
  name                 = "DBT_TERRAFORM"
  password             = "dbtPassword123"
  login_name           = "DBT_TERRAFORM"
  must_change_password = false
  default_role         = snowflake_role.role.name
}


resource "snowflake_role_grants" "grants" {
  role_name = "ACCOUNTADMIN"

  roles = [
    snowflake_role.role.name,
  ]

  users = [
    snowflake_user.user.name,
  ]
}

resource "snowflake_warehouse_grant" "warehouse_grant" {
  warehouse_name = snowflake_warehouse.tf_demo_warehouse.name
  privilege      = "OPERATE"
  roles          = [snowflake_role.role.name]
}

resource "snowflake_database_grant" "database_ro_grant" {
  database_name = snowflake_database.tf_demo_database.name
  privilege     = "ALL PRIVILEGES"
  roles         = [snowflake_role.role.name]
}

resource "snowflake_schema_grant" "schema_ro_grant_all" {
  database_name = snowflake_database.tf_demo_database.name
  privilege     = "ALL PRIVILEGES"
  roles         = [snowflake_role.role.name]
  on_all        = true
}

resource "snowflake_schema_grant" "schema_ro_grant_future" {
  database_name = snowflake_database.tf_demo_database.name
  privilege     = "ALL PRIVILEGES"
  roles         = [snowflake_role.role.name]
  on_future     = true
}

resource "snowflake_table_grant" "table_ro_grant_all" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema_src.name
  privilege     = "ALL PRIVILEGES"
  roles         = [snowflake_role.role.name]
  on_all        = true
}

resource "snowflake_table_grant" "table_ro_grant_future" {
  database_name = snowflake_database.tf_demo_database.name
  schema_name   = snowflake_schema.tf_demo_schema_src.name
  privilege     = "ALL PRIVILEGES"
  roles         = [snowflake_role.role.name]
  on_future     = true
}
