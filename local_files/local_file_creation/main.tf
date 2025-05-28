resource "local_file" "name" {
    filename = each.key
    content = each.value

    for_each = var.files
    # count = var.enable_creation ? 1 : 0
}