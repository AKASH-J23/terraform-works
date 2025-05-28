module "imported" {
    source = "./modules/local_writer"
    filename = "practice.txt"
    content = <<EOF
    This is my first module which was created within
    multiple lines for better practice. 
    Some random content to work on with
    EOF
}