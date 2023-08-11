variable "components" {
  default = [ "catalogue", "frontend", "mongodb" ]
}

resource "aws_security_group" "allow_tls" {
  count = length(var.components)
  name        = element(var.components, count.index)
}
