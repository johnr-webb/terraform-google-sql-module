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

  settings {
    tier = var.instance_tier
  }
}

resource "google_sql_user" "sql_user" {
  name = var.sql_user_name
  instance = google_sql_database_instance.sql_database_instance.name
  password = random_password.pwd.result

  depends_on = [
    random_password.pwd, google_sql_database_instance.sql_database_instance
  ]
}

resource "random_password" "pwd" {
  length = 16
  special = false
}
