
# output "public_subnets" {
#   value = concat(list(aws_subnet.public_subnet.*.id))
# }

output "private_subnets" {
  value = concat(list(aws_subnet.private_subnet.*.id))
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_name" {
  value = var.name
}

output "vpc_subnet" {
  value = var.subnet
}

output "public_router" {
  value = aws_route_table.default_route_table.id
}

output "private_router" {
  value = aws_route_table.private_route_table.id
}

output "nat_gateway_eip" {
  value = aws_eip.nat_gateway.public_ip
}
