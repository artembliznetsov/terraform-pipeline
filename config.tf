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
            private_key = "${file("~/.ssh/id_rsa")}"
        }

        inline = [
            "sudo apt update",
            "sudo apt install -y nginx",
            "sudo sed -i 's/<h1>.*/<h1>Welcome to host ${self.public_ip}<\/h1>/' /var/www/html/index.nginx-debian.html"
        ]
    }
}

