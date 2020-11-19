terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    statuscake = {
      source = "terraform-providers/statuscake"
    }

    opsgenie = {
      source = "opsgenie/opsgenie"
      version = "0.2.3"
    }

  }
  required_version = ">= 0.13"
}
