
resource "aws_lb" "alb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]
}

resource "aws_lb_target_group" "target_group" {
  name = "targettg"
  port = 80 
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc.id
  health_check {
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
  }
}

resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
    port              = "80"
    protocol          = "HTTP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.target_group.arn
    }

}