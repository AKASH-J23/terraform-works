variable "name" {
  type = string
}

variable "policy" {
    # type = map(string)
    validation {
        error_message = "policy need to be in json format"
        condition = length(keys(var.policy)) > 0
    }
}

variable "description" {
    type = string
    default = "This is the default description created using modules"
}