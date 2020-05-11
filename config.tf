provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "example" {
    ami = "ami-07c1207a9d40bc3bd"
    instance_type = "t2.micro"
    key_name = "myKey"
    security_groups = "General group"

    provisioner "local-exec" {
        command = "apt update"
    }
    provisioner "local-exec" {
        command = "apt install -y nginx"
    }
}

