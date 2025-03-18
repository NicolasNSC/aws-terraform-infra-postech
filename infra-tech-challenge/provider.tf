terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.91.0"
    }
  }

  required_version = ">= 1.0.0"
}



provider "aws" {
  
  assume_role {
    role_arn = "arn:aws:iam::923490220058:role/LabRole"
  }
}