locals {
  trimmed    = trimspace(var.input)
  lower      = lower(local.trimmed)
  upper      = upper(local.trimmed)
  replaced   = replace(local.trimmed, "Terraform", "Akash")
  length     = length(local.trimmed)
  short_word = substr(local.trimmed, 6, 9)
}

resource "local_file" "string_output" {
  filename = "string_output.txt"
  content = <<EOF
Original : "${var.input}"
Trimmed  : "${local.trimmed}"
Lowercase: "${local.lower}"
Uppercase: "${local.upper}"
Replaced : "${local.replaced}"
Length   : "${local.length}"
Substring: "${local.short_word}"
EOF
}
