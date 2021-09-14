#################################
# Variables for Redshift cluster
#################################

variable "cluster_identifier" {
    type = string
    description = "The redshift cluster identifier"
}

variable "database_name" {
    type = string
    description = "The redshift database name"
}

variable "node_type" {
    type = string
    description = "The redshift node type"
}

variable "publicly_accessible" {
    type = bool
    description = "Determine if to make the cluster publicly accessible"
}

variable "cluster_type" {
    type = string
    description = "The redshift cluster type"
}