terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.91.0"
    }
  }

  required_version = ">= 1.0.0"
}

variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "AWS_REGION" {}
variable "AWS_SESSION_TOKEN" {}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region = var.AWS_REGION
  token = var.AWS_SESSION_TOKEN
  assume_role {
    role_arn = "arn:aws:iam::923490220058:role/LabRole"
  }
}