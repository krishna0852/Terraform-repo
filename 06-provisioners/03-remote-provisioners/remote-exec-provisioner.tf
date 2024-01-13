provider "aws"{
    access_key = "give-access-key-here"
    secret_key = "give-secret-key-here"
    region="give-region-here"
}

resource "aws_instance" "launch-instance"{
    ami="give the respective region os ami here"
    instance_type="t3.micro"
    key_name = "provis"
    tags={
        Name="provisioner"
        executebyterraform=true
    }

    provisioner "remote-exec" {
      inline=[
        "echo this is remote provisioners-lab -session",
        "echo creating file",
        "touch file.txt",
        "adding this line to the file >> file.txt"
      ] 
      
    }

    connection {
      type = "ssh"
      private_key = file("C:/Users/palla/provis.pem")
      host = self.public_ip
      user = "ubuntu"
      timeout = "4m"

    }
}

resource "aws_security_group" "custom-sg"{
    description = "custom-sg-instance"

    ingress {
        description = "inbound-traffic"
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {

        description = "outbound-traffic"
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
}

resource "aws_key_pair" "kpair" {
    key_name="provis"
    public_key = "paste the public-key here"

}