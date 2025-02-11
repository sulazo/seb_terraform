# Work with COMPUTE_HEALTH_CHECK via terraform

A terraform module for making COMPUTE_HEALTH_CHECK.


## Usage
----------------------
Import the module and retrieve with ```terraform get``` or ```terraform get --update```. Adding a module resource to your template, e.g. `main.tf`:

```
#
# MAINTAINER Vitaliy Natarov "vitaliy.natarov@yahoo.com"
#
terraform {
  required_version = "~> 0.13"
}

provider "google" {
  #credentials = "${file("/Users/captain/.config/gcloud/creds/captain_creds.json")}"
  credentials = file("/Users/captain/.config/gcloud/creds/terraform_creds.json")
  project     = "terraform-2018"
  region      = "us-east-1"
}

module "compute_health_check" {
  source = "../../modules/compute_health_check"
  name   = "TEST"

  project = "terraform-2018"

  enable_compute_http_health_check  = true
  enable_compute_https_health_check = true
  enable_compute_ssl_health_check   = true
  enable_compute_tcp_health_check   = true
}

```

## Module Input Variables
----------------------
- `name` - A unique name for the resource, required by GCE. Changing this forces a new resource to be created. (`default = TEST`)
- `custom_name` - A custom name for the resource, required by GCE. Changing this forces a new resource to be created. (`default = ""`)
- `project` - The project in which the resource belongs. If it is not provided, the provider project is used. (`default = ""`)
- `zone` - The zone that the machine should be created in (`default = us-east1-b`)
- `environment` - Environment for service (`default = STAGE`)
- `orchestration` - Type of orchestration (`default = Terraform`)
- `createdby` - Created by (`default = Vitaliy Natarov`)
- `project_name` - The ID of the project in which the resource belongs. If it is not provided, the provider project is used. (`default = ""`)
- `check_interval_sec` - The number of seconds between each poll of the instance instance (default 5). (`default = 5`)
- `timeout_sec` - The number of seconds to wait before declaring failure (default 5). (`default = 5`)
- `description` - Textual description field. (`default = ""`)
- `healthy_threshold` - Consecutive successes required (default 2). (`default = 2`)
- `unhealthy_threshold` - Consecutive failures required (default 2). (`default = 2`)
- `enable_compute_http_health_check` - Enable compute http health check usage (`default = False`)
- `http_health_check_host` - HTTP host header field (default instance's public ip). (`default = ""`)
- `http_health_check_port` - HTTP port to connect to (default 80). (`default = 80`)
- `http_health_check_proxy_header` - Type of proxy header to append before sending data to the backend, either NONE or PROXY_V1 (default NONE). (`default = NONE`)
- `http_health_check_request_path` - URL path to query (default /). (`default = /`)
- `enable_compute_https_health_check` - Enable compute https health check usage (`default = False`)
- `https_health_check_host` - HTTPS host header field (default instance's public ip). (`default = ""`)
- `https_health_check_port` - HTTPS port to connect to (default 443). (`default = 443`)
- `https_health_check_proxy_header` - Type of proxy header to append before sending data to the backend, either NONE or PROXY_V1 (default NONE). (`default = NONE`)
- `https_health_check_request_path` - URL path to query (default /). (`default = /`)
- `enable_compute_ssl_health_check` - Enable compute ssl health check usage (`default = False`)
- `ssl_health_check_port` - SSL port to connect to (default 443). (`default = 443`)
- `ssl_health_check_proxy_header` - Type of proxy header to append before sending data to the backend, either NONE or PROXY_V1 (default NONE). (`default = NONE`)
- `ssl_health_check_request` - Application data to send once the SSL connection has been established (default ''). (`default = ""`)
- `ssl_health_check_response` - The response that indicates health (default '') (`default = ""`)
- `enable_compute_tcp_health_check` - Enable compute tcp health check usage (`default = False`)
- `tcp_health_check_port` - TCP port to connect to (default 80). (`default = 80`)
- `tcp_health_check_proxy_header` - Type of proxy header to append before sending data to the backend, either NONE or PROXY_V1 (default NONE). (`default = NONE`)
- `tcp_health_check_request` - Application data to send once the TCP connection has been established (default ''). (`default = ""`)
- `tcp_health_check_response` - The response that indicates health (default '') (`default = ""`)

## Module Output Variables
----------------------
- `http_name` - Name of http HC
- `http_self_link` - self_link of http HC
- `https_name` - Name of https HC
- `https_self_link` - self_link of https HC
- `ssl_name` - Name of ssl HC
- `ssl_self_link` - self_link of ssl HC


## Authors

Created and maintained by [Vitaliy Natarov](https://github.com/SebastianUA). An email: [vitaliy.natarov@yahoo.com](vitaliy.natarov@yahoo.com).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/SebastianUA/terraform/blob/master/LICENSE) for full details.
