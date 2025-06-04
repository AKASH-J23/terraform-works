module "aws_key_pair_generation" {
    source = "./module/key_pair"
    key_name = "terraform_key"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "generating_security_group" {
    name = "My_first_security_group"
    description = "This is the first time i am creating this security group"
    vpc_id = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
    security_group_id = aws_security_group.generating_security_group.id
    from_port = 22
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
    security_group_id = aws_security_group.generating_security_group.id
    ip_protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_instance" "instance_creation" {
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    key_name = module.aws_key_pair_generation.aws_key_pair_name
    vpc_security_group_ids = [ aws_security_group.generating_security_group.id ]

    provisioner "file" {
        source = "sample.txt"
        destination = "/home/ubuntu/sample.txt"

        connection {
          type = "ssh"
          user = "ubuntu"
          private_key = module.aws_key_pair_generation.private_key
          host = self.public_ip
        }
    }
    
    provisioner "remote-exec" {
        inline = [ 
            "cd /home/ubuntu/",
            "cat sample.txt"
        ]

        connection {
          type = "ssh"
          user = "ubuntu"
          private_key = module.aws_key_pair_generation.private_key
          host = self.public_ip
        }
    }

    provisioner "local-exec" {
      command = "echo EC2 created successfully"
    }
}