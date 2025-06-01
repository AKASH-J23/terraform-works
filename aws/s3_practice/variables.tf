variable "bucket_name" {
    type = string
    default = "autoupload-practice"

    validation {
      condition = can(regex("^[0-9A-Za-z.-]+$", var.bucket_name))
      error_message = "Invalid bucketname"
    }
}