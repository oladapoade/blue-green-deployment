resource "aws_lb" "app_lb" {
  name               = "oladapo-app-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  security_groups    = [aws_security_group.blue_sg.id] # Add both SGs if needed

  tags = {
    Name = "oladapo-app-lb"
  }
}

resource "aws_lb_target_group" "blue_tg" {
  name     = "blue-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "blue-target-group"
  }
}

resource "aws_lb_target_group" "green_tg" {
  name     = "green-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "green-target-group"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "blue_instance_attach" {
  target_group_arn = aws_lb_target_group.blue_tg.arn
  target_id        = aws_instance.blue_instance.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "green_instance_attach" {
  target_group_arn = aws_lb_target_group.green_tg.arn
  target_id        = aws_instance.green_instance.id
  port             = 80
}
