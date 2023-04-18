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


#Hello.zip is only available in build time (because of stash and unstash between agent)
locals {
  file_path = "${path.module}/hello.zip"
  file_base64sha256 = filesha256("${local.file_path}")
}
