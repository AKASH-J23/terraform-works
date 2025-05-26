terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }
}

provider "local" {
}

variable "num1" {
  default = 25
}

variable "num2" {
  default = 4
}

locals {
  addition = var.num1 + var.num2
  power    = pow(var.num1, var.num2)
  maximum  = max(var.num1, var.num2)
  sign     = signum(var.num2 - var.num1)
}

resource "local_file" "math_output" {
  filename = "calc.txt"
  content  = <<EOF
Addition: ${local.addition}
Power: ${local.power}
Maximum: ${local.maximum}
Sign: ${local.sign}
EOF
}
