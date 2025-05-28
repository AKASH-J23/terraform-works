variable "filename" {
    validation {
        condition     = endswith(var.filename, ".txt")
        error_message = "Filename must end with .txt"
  }
}

variable "content" {
    default = "Default content for this module if want to override use the parameter to pass your content"
}