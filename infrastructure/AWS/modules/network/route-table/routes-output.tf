################################
# Get ID of created Route Table
################################
output "route_table_id" {
  value = aws_route_table.route-table.id
}
