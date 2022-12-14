output "database_host" {
  description = "Link for SQL user"
  value = google_sql_database.sql_database.self_link
}

output "database_connection_name" {
  description = "Connection name for SQL instance"
  value = google_sql_database_instance.sql_database_instance.connection_name
}

output "database_username" {
  description = "Username for SQL user"
  value = google_sql_user.sql_user.name
}

output "database_password" {
  description = "Password for SQL user"
  value = nonsensitive(google_sql_user.sql_user.password)
}
