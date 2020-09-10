module "academy-deploy" {
  source  = "fuchicorp/chart/helm"

  deployment_name        = "hello-world"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
  deployment_path        = "hello-world"

  template_custom_vars  = {     
    deployment_image     = "${var.deployment_image}"
  }
}


output "application_endpoint" {
    value = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}

variable  "deployment_image" {
    default = "docker.fuchicorp.com/hello-world-app-dev-feature:4b7aacb"
}

variable "deployment_environment" {
    default = "dev"
}

variable "deployment_endpoint" {
    type = "map"
     default = {
        test  = "test.hello"
        dev  = "dev.hello"
        qa   = "qa.hello"
        prod = "hello"
        stage = "stage.hello"
  }
}

variable "google_domain_name" {
    default = "bsalizhan.com"
}