variable "sg_id" {
  type = string
}

variable "create" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "prefix_list_id" {
  type        = string
  description = "Prefix list ID"
}


variable "cloud_cluster_nodes_admin_cidr" {
  type = string
}