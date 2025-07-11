variable "region" {}
variable "environment" {}
variable "vpc_cidr_block" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "instance_type" {}
variable "db_instance_class" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "eks_cluster_role_arn" {}
variable "eks_cluster_role_name" {}
variable "eks_node_role_arn" {}
variable "eks_node_group_size" {}

