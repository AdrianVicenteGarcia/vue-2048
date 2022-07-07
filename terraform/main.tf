terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "web" {
  count                  = 4
  instance_type          = var.instance_type
  ami                    = var.ami
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name               = var.key_name

  tags = {
    name = "terraformInstance-${count.index}"

  }

}

#provisioner "file" {
#  source      = "docker-compose.yaml"
#  destination = "/home/ec2-user"
#
#  connection {
#    type        = "ssh"
#    user        = "ec2-user"
#    private_key = "${file("~/.ssh/id_rsa")}"
#    host        = self.public_dns
#  }
#}
