variable "instance_class" {
  type = string
}

variable "username-rds" {
  type = string
}

variable "password-rds" {
  type = string
}

variable "subnet_ids_rds" {
  type = list(string)
}

variable "subnet_ids_redis" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}