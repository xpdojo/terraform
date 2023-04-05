# https://www.terraform.io/language/values
variable "region" {
  type = string
  description = "AWS Region"
  default = "ap-northeast-2"
}

variable "profile" {
  type = string
  description = "AWS Profile"
}

variable "port" {
  type = number
  description = "Port"
  default = 8080
}
