variable "warehouse" {
  type    = string
  default = "R2AE_WAREHOUSE_TERRAFORM"
}

variable "database" {
  type    = string
  default = "R2AE_DATABASE_TERRAFORM"
}

variable "size" {
  type    = string
  default = "XSMALL"
}

variable "s3_path_listings_file" {
  type    = string
  default = "s3://r2ae-data-dbt-shane/listings.csv"
}

variable "s3_path_hosts_file" {
  type    = string
  default = "s3://r2ae-data-dbt-shane/hosts.csv"
}

variable "s3_path_reviews_file" {
  type    = string
  default = "s3://r2ae-data-dbt-shane/reviews.csv"
}

variable "env_name" {
  type = string
}