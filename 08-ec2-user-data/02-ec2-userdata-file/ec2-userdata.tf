provider "aws" {
    access_key = "AKIA2UC3CSCWT5ZEOAFT"
    secret_key="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"
    region="ap-southeast-2"
}


resource "aws_instance" "ec2-instance" {

    ami="ami-04f5097681773b989"
    instance_type="t3.micro"
    key_name= "bashscript"
    tags={
        Name="test-ec2"
        executebyterraform=true 
    }  
    user_data = file("user/palla/jenkins-install.sh")
}