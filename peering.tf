# VPC peering
resource "aws_vpc_peering_connection" "peering" {   
  count       = var.is_peering_required ? 1 : 0     # condition for vnet peering
  vpc_id      = aws_vpc.main.id         # requestor
  peer_vpc_id = data.aws_vpc.default.id # acceptor
  auto_accept = true

  tags = merge(
    var.common_tags,
    var.vpc_perring_tags,
    {
      Name = "${local.resource_name}-Default-VPC"
    }
  )
}
# create a routes for expence VPC - public
resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
# create a routes for expence VPC - private
resource "aws_route" "private_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
# create a routes for dexpence VPC - database
resource "aws_route" "database_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
# create a routes for default VPC
resource "aws_route" "default_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = data.aws_route_table.main.id
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

