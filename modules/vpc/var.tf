variable "availability_zones" {
  description = "List of availability zone names to create subnets within"
  default = [
    "ap-southeast-2a",
    "ap-southeast-2b",
  ]
}

variable "subnet_address_bits" {
  description = "Number of bits to address per subnet"
  default = 8
}

variable "public_subnets_address_offset" {
  description = "Address start point creating public subnets."
  default = 0
}

variable "private_subnets_address_offset" {
  description = "Address start point for creating private subnets."
  default = 100
}

variable "name" {
  description = "Name of VPC, to be used in naming and tagging"
  default = "demo-amy"
}

variable "vpc_tags" {
  description = "Optional extra tag to add to the VPC."
  type = map
  default = {}
}
variable "subnet" {
  description = "The address space that is assigned to the VPC ensure that enough bit space is given to allow for subnet configuration"
  default = "10.0.0.0/16"
}

variable "public_subnet_tags" {
  description = "Optional extra tag to add to the subnet."
  type = map
  default = {}
}

variable "private_subnet_tags" {
  description = "Optional extra tag to add to the subnet."
  type = map
  default = {}
}