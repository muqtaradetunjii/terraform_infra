variable "aws_region" {
  description = "this is the region of the aws infra"
  type        = string
  default     = "eu-north-1"
}

variable "environment" {
  description = "this is a tag for the environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "this is the vpc cidr block range"
  type        = string
  default     = "10.0.0.0/16"
}