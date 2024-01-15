provider "aws"{
    access_key="give-access-key-here"
    secret_key="give-secret-key-here"
    region="ap-southeast-2"
}

resource "aws_iam_policy" "bucker-policy"{
    name="s3-access"
    path="/"
    description = "policy to list s3 buckets"
    policy = jsonencode({
     Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
    })
}