provider "aws"{
    access_key="AKIA2UC3CSCWX57N7I62"
    secret_key = "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"
    region="ap-southeast-2"
    

}

provider "aws"{
    alias = "east"
    access_key = "AKIA2UC3CSCWX57N7I62"
    secret_key = "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"
    region="us-east-1"
}

resource "aws_instance" "ec2"{
    ami="ami-04f5097681773b989"
    key_name="bashscript"
    instance_type="t3.micro"
    tags={
        Name="test"
        executebyterraform=true
    }
}

resource "aws_instance" "ec2-instance"{
    ami="ami-0c7217cdde317cfec"
    key_name="multi-region"
    instance_type="t3.micro"
    provider = aws.east
    tags={
        Name="test"
        executebyterraform=true
    }
}