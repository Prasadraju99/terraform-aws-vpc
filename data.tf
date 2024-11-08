data "aws_availability_zones" "available" {
  state = "available" # datasources to get data of availability zones from us-east-1
}

# data "aws_vpc" "default" {  # to get data of the desired/specific vpc id
#   filter {
#     name   = "tag:Name"
#     values = ["Default-VPC"]
#   }
# }

data "aws_vpc" "default" {    # to get data/vpc_id from default VPC
  default = true
}

data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name = "association.main"
    values = ["true"]
  }
}
