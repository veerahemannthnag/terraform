resource "google_sql_database_instance" "master" {
  name             = "master-instance"
  database_version = "POSTGRES_13"
  region           = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "users" {
  name     = var.cloudsql_user
  instance = google_sql_database_instance.master.name
  password = var.cloudsql_password
}


variable cloudsql_user {
  type        = string
  sensitive   = true
}
variable cloudsql_password {
  type        = string
  sensitive   = true
}