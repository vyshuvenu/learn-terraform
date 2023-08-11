variable "components1" {
  default = {
    frontend = { name = "frontend_sg" }
    catalogue = { name = "catalogue_sg" }
    mongodb = { name = "mongodb_sg"  }
  }
}


resource "aws_security_group" "allow_tls1" {
  for_each = var.components1
  name        = lookup(var.components1, each.value["name"], null)
}

