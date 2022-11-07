locals {
  environment = "${lookup(var.workspace_to_env_map, terraform.workspace, "staging")}"
  project_id = "${var.env_to_project_id_map[local.environment]}"
}

module "instances" {
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
