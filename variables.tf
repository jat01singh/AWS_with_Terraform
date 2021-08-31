#defining region
variable "region" {
  type    = string
  default = "us-east-1"
}

#ebs device name
variable "device_name" {
  type    = string
  default = "/dev/sdb"
}
