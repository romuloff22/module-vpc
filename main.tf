terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }

 /* backend "s3" {
    bucket = "remote-state-homolog"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-2"
  }
}*/

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      owner       = "romulo"
      managed-by  = "terraform"
      environment = "Homolog"
    }
  }
}
