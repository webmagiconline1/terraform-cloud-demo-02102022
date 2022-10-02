provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "techtodinc.tk"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}