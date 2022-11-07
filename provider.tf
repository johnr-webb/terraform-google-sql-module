terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.42.1"
    }
  }
}

provider "google" {
  # project = local.project_id
  credentials = var.gcp_credentials
  region = var.region
  zone = var.zone_env_map[local.environment]
}