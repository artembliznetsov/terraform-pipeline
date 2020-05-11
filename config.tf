provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "example" {
    ami = "ami-07c1207a9d40bc3bd"
    instance_type = "t2.micro"
    key_name = "myKey"
    security_groups = ["General group"]

    provisioner "remote-exec" {
        connection {
            type = "ssh"
            user = "ubuntu"
            host = "${self.public_ip}"
        }

        inline = [
            "sudo apt update",
            "sudo apt install -y nginx"
        ]
    }
}

