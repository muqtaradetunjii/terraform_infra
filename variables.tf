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

variable "public_subnet_1" {
    description = "this is the ip address of public subnet 1"
    type = string 
    default = "10.0.1.0/24"

}

variable "public_subnet_2" {
    description = "this is the ip address of public subnet 2"
    type = string
    default = "10.0.3.0/24"
}


variable "private_subnet_1"{
    description = "this is the ip address of private subnet 1"
    type = string
    default = "10.0.2.0/24"
}

variable "private_subnet_2" {
    description = "this is the ip address of private subnet 2"
    type = string 
    default = "10.0.4.0/24"
}