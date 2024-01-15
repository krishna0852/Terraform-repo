provider "aws" {
    access_key="give-access-key"
    secret_key="give-secret-key"
    region= "ap-southeast-2"
}

resource "aws_s3_bucket" "bucket"{
    bucket="tghyrtl78ist"
}

resource "aws_iam_policy" "policy"{
    name = "s3-policy" 
    description="s3-policy"
    path="/"
    policy = data.template_file.getpolicy.rendered   
     /*here we are not writing the policy directly, we are maintaing policy file separately and calling 
     those policy file through data template*/ 
}

data template_file "getpolicy"{
     
     template = "${file("${path.module}/policy.json")}"

     vars = {
          bucket_arn=aws_s3_bucket.bucket.arn
     }
}