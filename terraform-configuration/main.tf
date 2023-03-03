provider "aws" {
  region = "us-east-1"
}

terraform {
  cloud {
    organization = "arieldomchik"

    workspaces {
      name = "Lambda"
    }
  }
}

locals {
  file_path = "${path.module}/hello.zip"
  file_base64sha256 = filesha256("${local.file_path}")
}
