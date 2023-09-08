output "aws_s3_bucket" {
  value = aws_s3_bucket.r2ae_data_dbt_shane.bucket
}

output "aws_iam_user" {
  value = aws_iam_user.access_user.name
}

output "snowflake_role" {
  value = snowflake_role.role.name
}

output "snowflake_warehouse" {
  value = snowflake_warehouse.tf_demo_warehouse.name
}

output "snowflake_database" {
  value = snowflake_database.tf_demo_database.name
}

output "snowflake_schema_src" {
  value = snowflake_schema.tf_demo_schema_src.name
}

output "snowflake_schema_raw" {
  value = snowflake_schema.tf_demo_schema_raw.name
}

output "snowflake_schema_tnfm" {
  value = snowflake_schema.tf_demo_schema_tnfm.name
}
