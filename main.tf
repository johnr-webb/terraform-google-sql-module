resource "google_sql_database" "sql_database" {
  name = var.database_name
  instance = google_sql_database_instance.sql_database_instance.name

  depends_on = [
    google_sql_database_instance.sql_database_instance
  ]
}

resource "google_sql_database_instance" "sql_database_instance" {
  name = var.database_instance_name
  database_version = var.database_version
  region = var.instance_region

  deletion_protection = false

  settings {
    tier = var.instance_tier
  }
}

resource "google_sql_user" "sql_user" {
  name = var.sql_user_name
  instance = google_sql_database_instance.sql_database_instance.name
  password = random_password.database_password.result

  depends_on = [
    google_sql_database_instance.sql_database_instance, random_password.database_password
  ]
}

resource "random_password" "database_password" {
  length = 16
}