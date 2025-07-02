
#Create an instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2_profile"
    role = aws_iam_role.ec2_role.name
}

# Create Auto Scaling Group
resource "aws_launch_configuration" "app" {
    name = "app-lc"
    image_id = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.HTTP-SG.id]
    key_name = "mykey"
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World!" > index.html
                nohup busybox httpd -f -p 80 &
                EOF
}

resource "aws_autoscaling_group" "app" {
    launch_configuration = aws_launch_configuration.app.name
    min_size = 1
    max_size = 3
    desired_capacity = 2
    vpc_zone_identifier = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]
    target_group_arns = [aws_lb_target_group.target_group.arn]
    health_check_type = "ELB"
    health_check_grace_period = 300
    tag {
        key = "Name"
        value = "app"
        propagate_at_launch = true
    }

    lifecycle {
        ignore_changes = [ desired_capacity ]
    }
  
}