variable "project_name" {
  default = true
}

variable "environment" {
  default = true
}

variable "vpc_cidr" {
  default = "10.0.0.0.16"
}

variable "enable_dns_hostnames" {
  default = true
}

variable "common_tags" {
  default = {}
}

variable "vpc_tags" {
  default = {}
}