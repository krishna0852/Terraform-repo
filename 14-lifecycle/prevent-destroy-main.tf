provider "aws"{
    access_key = ""
    secret_key = ""
    region = ""
}


resource aws_instance "instance"{
  ami="ami-0d6f74b9139d26bf1"
  instance_type = "t3.micro"
  key_name = "bashscript"
  #availability_zone = "ap-southeast-2b"
  availability_zone = "ap-southeast-2c"

  lifecycle{
   prevent_destroy = true
  }
}


/*

when there is a resource with lifecyle as prevent_destroy=true then when we destroy resorues
using the terraform destroy , the resources which has that life cycle will not destroy
and throws an error that it can't be delete since the prevent_destroy is set to true 

if we still need to destroy then we need to make it as false (default) or else 
we can remove that lifecycle block and then destroy

*/