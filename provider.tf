terraform {
  cloud {
    organization = "devopsify"

    workspaces {
      name = "ssm-document-automation"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}
