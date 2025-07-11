variable "private_subnet_ids" {
  type = list(string)
}

variable "db_instance_class" {
  type = string
}

variable "db_username" {
  type = string
  default = "admin"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_sg_id" {
  type = string
}

variable "environment" {
  type = string
}
