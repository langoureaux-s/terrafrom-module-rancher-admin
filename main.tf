terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "consul" {}
}

# Template provider
provider "template" {
  version = "~> 1.0"
}

# Get the project data
data "rancher_environment" "project" {
  name = "${var.project_name}"
}




data "template_file" "docker_compose_admin" {
  template = "${file("${path.module}/rancher/admin/docker-compose.yml")}"

  vars {
    external_links          = "${indent(6, join("\n", formatlist("- %s", var.external_links)))}"
    volumes                 = "${indent(6, join("\n", formatlist("- %s", var.volumes)))}"
    label_scheduling        = "${var.label_scheduling}"
    volumes_section         = "${indent(2, join("\n", formatlist("%s:\n  driver: %s\n  external: %s\n", var.volumes_name, var.volumes_driver, var.volumes_external)))}"
  }
}
data "template_file" "rancher_compose_admin" {
  template = "${file("${path.module}/rancher/admin/rancher-compose.yml")}"

  vars {
  }
}
resource "rancher_stack" "this" {
  name            = "${var.stack_name}"
  description     = "Admin shell"
  environment_id  = "${data.rancher_environment.project.id}"
  scope           = "user"
  start_on_create = true
  finish_upgrade  = "${var.finish_upgrade}"
  docker_compose  = "${data.template_file.docker_compose_admin.rendered}"
  rancher_compose = "${data.template_file.rancher_compose_admin.rendered}"
}