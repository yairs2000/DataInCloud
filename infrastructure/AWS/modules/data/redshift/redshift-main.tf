##############################
# Create a redshift cluster
##############################

resource "aws_redshift_cluster" "redshiftcl" {
  cluster_identifier = var.cluster_identifier
  database_name      = var.database_name
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = var.node_type
  cluster_type       = var.cluster_type
  publicly_accessible = var.publicly_accessible 
}