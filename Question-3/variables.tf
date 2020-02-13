variable "region" {
  type    = string
  value   = us-east-2
  default = ["us-west-1"]
}

variable "ami" {
  type  = string
  value =<ami id>
}
variable "access_key" {
  type  = string
  value = <access_key>
}

variable "secret_key" {
  type    = string
  value   = <secret_key>
}

variable "instance_type" {
  type    = string
  value   = t2.micro
}
variable "cidr_blocks" {
  type    = string
  value   = ["10.11.135.0/24"]
}
variable "vpc_id" {
  type    = string
  value   = <id of the vpc>
}