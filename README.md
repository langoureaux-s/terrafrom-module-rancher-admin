# terraform-module-rancher-admin

This module permit to deploy admin stack on Rancher 1.6.x.

```
terragrunt = {
  terraform {
    source = "git::https://github.com/langoureaux-s/terraform-module-rancher-admin.git"
  }
  
  project_name            = "test"
  stack_name              = "admin"
  finish_upgrade          = "true"
  label_global_scheduling = "admin=true"
  external_links          = ["elasticsearch/elasticsearch:elasticsearch", "kibana/kibana:kibana"]
  volumes                 = ["elasticsearch_conf_xpack:/mnt/x-pack"]
  volumes_name            = ["elasticsearch_conf_xpack"]
  volumes_driver          = ["rancher-nfs"]
  volumes_external        = ["true"]
}
```

> Don't forget to read the file `variables.tf` to get all informations about variables.