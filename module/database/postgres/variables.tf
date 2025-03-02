variable "service_name" {
  type = string
}

variable "environment" {
  type        = string
}

variable "db_instance_class" {
  type = string
}

variable "db_allocated_storage" {
  type = number
}

variable "db_max_allocated_storage" {
  type = number
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}

variable "db_name" {
  type = string
  default = var.service_name + "-" + var.env
}