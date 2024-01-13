provider "aws"{
    access_key=var.credentials["akey"]
    secret_key=var.credentials["skey"]
    region="ap-southeast-2"
}

resource "aws_instance" "ec2-launch"{
    ami=var.ami
    instance_type=var.instance_types[0]
    key_name = var.key

    tags={
        Name="test"
        executebyterraform=true
    }
}

variable "credentials" {
type=map(string)
default={
    "akey"="AKIA2sthegyeyeuushhsL"
    "skey"="k/xZusH4gE6Ulnrebhggtrewwsggsgs"
}  
}

variable "ami" {
    type=string
    default = "ami-04f5097681773b989"

}

variable "instance_types"{
    type=list(string)
    default = [ "t3.micro","t3.medium","t3.large" ]
}

variable "key" {
    type=string
    default = "bashscript"

}



  