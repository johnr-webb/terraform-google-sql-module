output "test_output" {
  value = "test output"
}

output "database_host" {
  description = "Host for SQL user"
  value = google_sql_user.sql_user.host
}

output "database_username" {
  description = "Username for SQL user"
  value = google_sql_user.sql_user.name
}

output "database_password" {
  sensitive = true
  description = "Password for SQL user"
  value = google_sql_user.sql_user.password
}
