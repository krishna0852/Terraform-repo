provider "aws"{
    access_key=var.access_key
    secret_key=var.secret_key
    region=var.region
}

resource "aws_instance" "ec2-launch"{
    ami=var.ami
    instance_type=var.instance_type
    key_name = var.key_name

    tags={
        Name=var.instance_name
        executebyterraform=var.executionby
    }
}

variable "access_key" {
  description="access-key"
  default="give-access-key-here"
}


variable "secret_key" {
  description="secret-key"
  default="give-secret-key-here"
}

variable "region" {
  description="region"
  type=string 
  default="ap-southeast-2"
}

variable "ami" {
  description="ami"
  type=string 
  default="give-ami-here" #amis are region specific 
}

variable "instance_type" {
  description="instance-type"
  type=string
  default="t3.micro"
}

variable "key_name" {
  description="key-name"
  default="bashscript"
}


variable "instance_name" {
  description="instance-name"
  type=string
  default="test"
}


variable "executionby" {
  description="tags"
  type=bool
  default=true
}