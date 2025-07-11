variable "subnet_ids" {
  type = list(string)
}

variable "cluster_role_arn" {
  type = string
}

variable "cluster_role_name" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "node_group_size" {
  type = number
}

variable "environment" {
  type = string
}
