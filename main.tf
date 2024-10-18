terraform {
  required_version = "1.9.6"
  backend "local" {
    path = "terraform.state"
  }
}

provider "aws" {

  region  = "us-east-1"
  profile = "default"
}