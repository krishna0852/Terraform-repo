provider "aws" {
    access_key = "give accesskey-here "
    secret_key="give secretkey here"
    region="ap-southeast-2"
}



resource "aws_instance" "instance-block" {
   
      count=3 
      ami="ami-04f5097681773b989"
      instance_type=var.instance_types[count.index]
      tags = {
        
        Name=var.test[count.index]
        
    }
        
}


variable "instance_types" {
    type=list(string)  
    default = [ "t3.micro","t3.medium","t3.large" ]
}

variable "test" {
    type=list(string)
    default = [ "test-server","int-server","prod-server" ] 
}
  