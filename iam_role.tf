

resource "aws_iam_role" "ec2_role" {
    name = "ec2_role"

    assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
    EOF
}

#S3 policy
resource "aws_iam_policy" "s3_policy" {
    name = "s3_policy"
    description = "Allow S3 access"
    policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Action": [
            "s3:ListBucket",
            "s3:GetObject",
            "s3:PutObject"  
        ],
        "Resource": "arn:aws:s3:::my-s3-bucket/*"
        }
    ]
    }
    EOF
}

#Attach S3 policy to the role
resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
    policy_arn = aws_iam_policy.s3_policy.arn
    role = aws_iam_role.ec2_role.name
}
