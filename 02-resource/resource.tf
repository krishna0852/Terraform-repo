resource "aws_instance" "ec2-launch"{

 ami="mention region"
 instance_type="t3.micro"
 key_name ="bashscript" #"give key name which is created"

 tags={
    Name="test-intance"
    executebyterraform=true
 }
}

