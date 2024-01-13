provider "aws" {
    access_key = "AKIA2UC3CSCWX57N7I62"
    secret_key = "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"
    region="ap-southeast-2"
}


resource "aws_instance" "ec-2"{
    ami="ami-04f5097681773b989"
    instance_type="t3.micro"
    key_name = "bashscript"

    tags={
        Name="test-instance"
        executebyterraform=true
    }
}
