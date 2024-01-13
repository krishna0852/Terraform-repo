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

    provisioner "local-exec" {
       command = "touch file.txt"
      
    }

}


 

