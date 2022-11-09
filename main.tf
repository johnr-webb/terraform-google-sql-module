resource "google_sql_database" "sql_database" {
  name = "my-database"
  instance = google_sql_database_instance.sql_database_instance.name
}

resource "google_sql_database_instance" "sql_database_instance" {
  name = "my-database-instance"
  database_version = "MYSQL_8_0"
  region = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "sql_user" {
  name = "mysql_user"
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
