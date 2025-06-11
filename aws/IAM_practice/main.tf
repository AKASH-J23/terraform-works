module "new_user" {
    source = "./module/aws_user"
    name = var.user_name
}

module "access_key" {
    source = "./module/aws_access_key"
    access_key = var.generate_key
    name = module.new_user.aws_iam_user
}

module "new_policy" {
    source = "./module/aws_policy"
    name = var.policy_name
    policy = var.policy
}