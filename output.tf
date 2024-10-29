output "vpc_id" {
  value = aws_vpc.main.id
}
# go get output info from the aws 
output "az_info" {
  value = data.aws_availability_zones.available
}