provider "aws" {
 region = "us-east-2"
}

resource "aws_instance" "example" {
 ami = "ami-07c1207a9d40bc3bd"
 instance_type = "t2.micro"

 provisioner "local-exec" {
    command = "IP ${self.private_ip}"
 }
}

