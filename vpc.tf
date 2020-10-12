# demo VPC

module "vpc" {
  source      = "./modules/vpc"  
  name        = "demo"
  subnet      = "10.150.0.0/16"
}
