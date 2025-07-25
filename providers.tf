terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.84.0"
    }
    polaris = {
      source  = "rubrikinc/polaris"
      version = ">= 1.1.2"
    }
  }
}
