# Variables in provider.tf
variable "project_id" {
  description = "Project to deploy too"
} 

variable "region" {
  description = "Region for project"
}

variable "zone" {
  description = "Zone for project"
}

# Variables in main.tf
variable "database_name" {
  description = "Name of database"
}

variable "database_instance_name" {
  description = "Name of database instance"
}

variable "database_version" {
  description = "Database version"
}

variable "instance_region" {
  description = "Region for SQL instance"
}

variable "instance_tier" {
  description = "Tier for SQL instance"
}

variable "sql_user_name" {
  description = "Name for SQL user"
}

# variable "user_password" {
#   description = "Password for SQL user"
#   default = "abcdefg1234567"
# }
