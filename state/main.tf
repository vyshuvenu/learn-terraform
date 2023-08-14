terraform {
  backend "s3" {
    bucket = "tf-state-db10"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

variable "test" {
  default = "Hello"
}

output "test" {
  value = var.test
}