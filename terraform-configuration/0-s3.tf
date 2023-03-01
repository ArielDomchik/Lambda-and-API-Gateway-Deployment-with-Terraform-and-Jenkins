provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "leumi-exercise2"
}

terraform {
  cloud {
    organization = "arieldomchik"

    workspaces {
      name = "Lambda"
    }
  }
}
