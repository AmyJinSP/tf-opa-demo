provider "aws" {
  profile = "sandbox"
  region  = "ap-southeast-2"
  version = " ~> 2.70.0"
}

terraform {
  backend "s3" {}
}