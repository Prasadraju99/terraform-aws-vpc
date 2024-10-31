output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids"{
  value = aws_subnet.public[*].id
}

output "private_subnet_ids"{
  value = aws_subnet.private[*].id
}

output "database_subnet_ids"{
  value = aws_subnet.database[*].id
}

output "database_subnet_group_name"{
  value = aws_db_subnet_group.default.name
}
# go get output info from the aws 
output "az_info" {
  value = data.aws_availability_zones.available
}
# go get output info of VPC id
output "default_vpc_info" {   
  value = data.aws_vpc.default
}

output "main_route_table_info" {
  value = data.aws_route_table.main
}
