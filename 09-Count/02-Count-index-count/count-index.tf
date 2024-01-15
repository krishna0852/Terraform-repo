provider "aws" {
    access_key = "AKIA2UC3CSCWUOHL7TUP"
    secret_key="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"
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
  