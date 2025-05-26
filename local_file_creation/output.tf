output "filed" {
    value = [for f in local_file.name : f.filename]
}