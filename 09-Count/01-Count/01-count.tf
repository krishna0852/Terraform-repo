provider "aws" {
    access_key = "give access key here "
    secret_key="give secret key here"
    region="ap-southeast-2"
}

resource "aws_instance" "instance-block" {
   
      count=3 
      ami="ami-04f5097681773b989"
      instance_type="t3.micro"
      tags = {
        Name="test-server"
        executebyterraform=true 
      }
}


# it will create three instances with same configuration 