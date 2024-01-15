provider "aws" {
    access_key = "give access-here"
    secret_key="give secretkey-here"
    region="ap-southeast-2"
}

resource "aws_instance" "instance-block" {
   
      for_each = { for idx, instance_type in var.instance_types : idx => instance_type }

      ami="ami-04f5097681773b989"
      instance_type=var.instance_types[each.key]
      tags = {
        Name=var.instance_names[each.key]
        executebyterraform=true 
      }
}

variable instance_types{
    type=list(string)
    default=["t3.micro","t3.medium","t3.large"]

}
variable instance_names{

    type=list(string)
    default=["test-server","int-server","prod-server"]
}


#idx (Index): idx represents the index of the current element in the var.instance_types list

/*instance_type: instance_type represents the actual value (element) at the current index in the var.instance_types list. In your case, 
these are the instance types, such as "t3.micro", "t3.medium", and "t3.larg*/

/* 
The purpose of using idx and instance_type in the for_each loop is to create a mapping between 
the index and the corresponding instance type. This mapping is then used to 
create a map that associates each index with its respective instance type:
*/

/*
{
  0 = "t3.micro",
  1 = "t3.medium",
  2 = "t3.large"
}


*/