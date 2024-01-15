provider "aws" {
    access_key = "AKIA2UC3CSCWSAXRTAMU"
    secret_key="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"
    region="ap-southeast-2"
}



locals {
    ingress_rules=[
        {
                description="allow-ssh"
                port="22"
        },
        {
             
                description="allow-HTTP"
                port="80"

        },
        {         
               
                description="allow-HTTPS"
                port="443"

        }
    ]
}

resource "aws_security_group" "sg" {
  name="security-group-ec2"
  description= "s-group"
    
    dynamic "ingress" {
      for_each = local.ingress_rules

      content {
        description = ingress.value.description 
        from_port = ingress.value.port
        to_port= ingress.value.port 
        protocol="tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    
    egress{
        description = "outbound-traffic"
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags={
        Name="sg-dynamic-block"
        executebyterraform=true
    }
}

resource "aws_instance" "launch-instace" {

       ami="ami-04f5097681773b989"
       instance_type="t3.micro"
       key_name = "bashscript" 
       vpc_security_group_ids = [aws_security_group.sg.id]

       tags={
        
        Name="test-instance"
        executebyterraform=true
       } 

       depends_on = [ aws_security_group.sg,aws_s3_bucket.bucket]
       #depends_on = [ aws_security_group.sg, aws_vpc, aws_subnet] can keep multiple dependencies 
}

resource "aws_s3_bucket" "bucket"{
    bucket = "khjuy67-bkt"
    
}