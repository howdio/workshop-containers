variable "instance_count" {
  default = 1
}

variable "public_key" {}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}
