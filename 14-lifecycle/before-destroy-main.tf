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
    create_before_destroy = true
  }
}


#first we will launch an ec2 instance in 2b and later we will change to 2c , as per the default
#behaviour it will terminate in 2b first adn then create instance in 2c 

#===

# when we use lifcycle block and in that create_before_destroy=true, first it will create instance in 2c
# and once it's up and running it will terminate the instance in 2b