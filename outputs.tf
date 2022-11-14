output "database_host" {
  description = "Link for SQL user"
  value = google_sql_database.sql_database.self_link
}

output "database_username" {
  description = "Username for SQL user"
  value = google_sql_user.sql_user.name
}

output "database_password" {
  description = "Password for SQL user"
  value = google_sql_user.sql_user.password
  sensitive = true
}
