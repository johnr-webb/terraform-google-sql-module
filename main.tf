resource "google_sql_database" "sql_database" {
  name = "my-database"
  instance = google_sql_database_instance.sql_database_instance.name
}

resource "google_sql_database_instance" "sql_database_instance" {
  name = "my-database-instance"
  database_version = "MYSQL_5_7"
  region = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "sql_user" {
  name = "mysql_user"
  instance = google_sql_database_instance.sql_database_instance.name
  host = 
  password = 
}

resource "random_password" "pwd" {
  length = 16
  special = false
}


module "sql_database" {
  # Must be hard coded
  source  = "app.terraform.io/jrw-test-org/instances/google"
  version = "v1.0.12"

  count = var.instance_count_map[local.environment]
  # Can also make a prefix variable too
  name = "${terraform.workspace}-instance-${count.index + 1}"
  machine_type = "${var.compute_size_map[local.environment]}"
  allow_stopping_for_update = var.allow_stopping_map[local.environment]
  zone = var.zone_env_map[local.environment]
}




resource "azurerm_resource_group" "vnet" {
  name     = var.resource_group_name
  location = "East US"
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  depends_on = [azurerm_resource_group.vnet]
}