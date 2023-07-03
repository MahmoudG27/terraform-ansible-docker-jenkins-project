variable "vpc-cidr" {
  type = string
}

variable "region" {
  type = string
}

variable "public1-cidr" {
  type = string
}

variable "public2-cidr" {
  type = string
}

variable "private1-cidr" {
  type = string
}

variable "private2-cidr" {
  type = string
}

variable "az1" {
  type = string
}

variable "az2" {
  type = string
}

variable "ec2_ami" {
  type = string
}
variable "ec2_type" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username-rds" {
  type = string
}

variable "password-rds" {
  type = string
}