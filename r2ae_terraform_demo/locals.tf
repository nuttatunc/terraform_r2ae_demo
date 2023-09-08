locals {
  env_name_upper = upper(var.env_name)
}

locals {
  suffix = local.env_name_upper == "PROD" ? "PRD" : "${local.env_name_upper}"
}

