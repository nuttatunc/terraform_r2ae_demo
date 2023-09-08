resource "snowflake_warehouse" "tf_demo_warehouse" {
  name           = "${var.warehouse}_${local.suffix}"
  warehouse_size = var.size
}

resource "snowflake_database" "tf_demo_database" {
  name                        = "${var.database}_${local.suffix}"
  data_retention_time_in_days = 1
  is_transient                = false
}

resource "snowflake_schema" "tf_demo_schema_src" {
  database = snowflake_database.tf_demo_database.name
  name     = "SRC_${local.suffix}"
}

resource "snowflake_schema" "tf_demo_schema_raw" {
  database = snowflake_database.tf_demo_database.name
  name     = "DBT_RAW_${local.suffix}"
}

resource "snowflake_schema" "tf_demo_schema_tnfm" {
  database = snowflake_database.tf_demo_database.name
  name     = "DBT_TNFM_${local.suffix}"
}