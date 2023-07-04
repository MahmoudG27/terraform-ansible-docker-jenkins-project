# Create an ALB
resource "aws_lb" "tf_alb" {
  name               = "my-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf_alb_sg.id]
  subnets            = var.subnets
  tags = {
    "Name" = "loadbalancer"
  }
  provisioner "local-exec" {
    command = "echo ${aws_lb.tf_alb.dns_name} > loadbalancer.txt"
  }
}

resource "aws_lb_target_group" "public_target_group" {
  name     = "public-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_security_group" "tf_alb_sg" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group_attachment" "target_gp_attach" {
  target_group_arn = aws_lb_target_group.public_target_group.arn
  target_id        = var.target_id
  port             = 80
}

resource "aws_lb_listener" "public-listener" {
  load_balancer_arn = aws_lb.tf_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_target_group.arn
  }
}