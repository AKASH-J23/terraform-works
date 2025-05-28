output "subjects" {
    value = keys(var.marks)
}

output "marks" {
    value = values(var.marks)   
}

output "newmap" {
    value = zipmap([for i in keys(var.marks): upper(i)], values(var.marks))
}

output "instance_type" {
  value = var.env == "prod" ? "Standard_DS2_v2" : "Standard_B1s"
}

output "is_valid_access" {
  value = can(file("secret.txt"))
}

output "some_value" {
  value = try(var.v1, var.v2, "default-value")
}

output "selected_name" {
  value = coalesce(var.v1, var.v2, var.v3, "default")
}