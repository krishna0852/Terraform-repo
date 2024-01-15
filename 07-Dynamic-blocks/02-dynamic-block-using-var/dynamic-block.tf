provider "aws" {
      access_key = "AKIA2UC3CSCW62KYXWNQ"
      secret_key="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"
      region="ap-southeast-2"  
}


resource "aws_instance" "instance" {
  ami="ami-04f5097681773b989"
  instance_type="t3.micro"
  key_name = "bashscript"
  vpc_security_group_ids = [aws_security_group.s-group.id]
  tags={
     Name="test"
     executebyterraform=true 
  }
}

resource "aws_security_group" "s-group" {
     name="test-group"
     description="test-instane-sg"
     
     dynamic "ingress" {
        for_each = var.ingress-rules

        content {
          description = ingress.value.description
          from_port = ingress.value.port 
          to_port=ingress.value.port 
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
        }
       
     }
     
     egress{
        description = "out-bound-traffic"
        from_port = "0"
        to_port = "0"
        protocol= -1
        cidr_blocks = ["0.0.0.0/0"]

     }  
}



variable "ingress-rules" {
type = map(object({
    description=string 
    port=number 
    protocol=string 
    cidr_blocks=list(string)
}))

default = {
  "key-1" = {
    description="allow-ssh"
    port=22
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }

   "key-2" = {
    description="allow-http"
    port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }

   "key-3" = {
    description="allow-https"
    port=443
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }

}

}
