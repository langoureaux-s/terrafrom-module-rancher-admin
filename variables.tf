variable "project_name" {
    description = "The project name (environment name)"
}
variable "stack_name" {
    description = "The name for the Elasticsearch stack"
}
variable "finish_upgrade" {
  description = "Automatically finish upgrade on Rancher when apply new plan"
}
variable "label_global_scheduling" {
  description = "The label to use when schedule this stack as global scheduling"
}


variable "external_links" {
  description = "The list of external links"
  type = "list"
}
variable "volumes" {
  description = "The list of volume to mount on container"
  type = "list"
}
variable "volumes_name" {
  description = "The volume name to declare as docker volume"
  type = "list"
}
variable "volumes_driver" {
  description = "The volume driver to declare as docker volume for each volume name"
  type = "list"
}
variable "volumes_external" {
  description = "The volume is external or not to declare as docker volume for each volume name"
  type = "list"
}




