variable "files" {
    type = map(string)
    default = {
      "one.txt" = "sammme text"
    }
    # validation {
    #   condition = contains(var.files, ".txt")
    #   error_message = "Valid file format is txt"
    # }
}

variable "enable_creation" {
    type = bool
    default = false
}

variable "stringed" {
    default = "Stinged bbeeee with"
    type = string
}

variable "listed" {
    type = list(string)
    default = ["a", "bc", 1, 2, 8.8]
}