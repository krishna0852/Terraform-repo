provider "aws"{
    access_key = "giveaccess-key"
    secret_key = "give-secret-key"
    region= "ap-southeast-2"
}

resource "aws_instance" "ec2-launch"{
    ami = "ami-04f5097681773b989"
    instance_type = "t3.micro"
    vpc_security_group_ids = [data.aws_security_group.getsgid.id]
    key_name="bashscript"

    tags={
        Name="data-source"
        executebyterraform=true
    }
}

data "aws_security_group" "getsgid"{
    name="launch-wizard-1"
}