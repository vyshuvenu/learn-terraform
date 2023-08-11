variable "security_groups"{
 default = [ sg-08aa5756a692da5db ]
}
variable "zone_id"{
 default = "Z07187411N9MH0R0B9I00"
}

variable "components" {
  default = {
    frontend ={
      name = "frontend"
      instance_type = "t2.micro"
    }
  }
}