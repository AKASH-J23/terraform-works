resource "local_file" "writer" {
  filename = var.filename
  content  = var.content
}