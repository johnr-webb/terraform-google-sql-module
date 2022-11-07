variable "env_to_project_id_map" {
  type = map(string)
  description = "Project map for Terraform GCP compute projects"
}

variable "organization" {
  type = string
  description = "Organization value for Terraform Cloud"
}

variable "workspace_to_env_map" {
  type = map(string)
  description = "Workspace value map for Terraform Cloud"
}

variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}

variable "region" {
  type = string
  description = "Default Region: US-CENTRAL1"
}

variable "zone_env_map" {
  type = map(string)
  description = "Default Zone: US-CENTRAL1-A"
}

variable "instance_count_map" {
  type = map(number)
  description = "Map of number of instances per environment"
}

variable "compute_size_map" {
  type = map(string)
  description = "Compute size value map"
}

variable "allow_stopping_map" {
  type = map(bool)
  description = "Allow stopping env map"
}