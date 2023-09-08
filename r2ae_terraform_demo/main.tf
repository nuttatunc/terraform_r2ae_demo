terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.66.1"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

provider "snowflake" {
  account  = "iibhicy-rq73599" #USE YOUR OWN ACCOUNT
  role     = "ACCOUNTADMIN"
  username = "SHANEADMIN"      #USE YOUR OWN ACCOUNT
  password = "shaneadmin123"   #USE YOUR OWN ACCOUNT
}
