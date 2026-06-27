# these ports are used by Technitian
locals {
  lb_ports = {
    "http"      = { lb_port = 80,   target_port = 80,   protocol = "TCP" }
    "https" = { lb_port = 443, target_port = 443, protocol = "TCP" }
    "tls" = { lb_port = 853, target_port = 853, protocol = "TCP" }
    "dns"  = { lb_port = 53, target_port = 53, protocol = "TCP_UDP" }
  }
}

#1. Security Group for LB (Internet -> LB)
resource "aws_security_group" "dadsdns_lb_sg" {
  name        = "dadsdns-lb-sg"
  description = "DadsDNS Server Security Group for Load Balancer"
  vpc_id = aws_vpc.custom_vpc.id
  dynamic "ingress" {
    for_each = local.lb_ports
    content {
      from_port   = ingress.value.lb_port
      to_port     = ingress.value.lb_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "dadsdns-lb-sg"
  }
}


# Security Group for EC2 Instances (ALB -> EC2)
resource "aws_security_group" "dadsdns_ec2_sg" {
  name        = "dadsdns-ec2-sg"
  description = "DadsDNS Security Group for DNS Server Instances"

  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.dadsdns_lb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dadsdns-ec2-sg"
  }
}

#2. Network Load Balancer
resource "aws_lb" "dadsdns_net_lb" {
  name               = "dadsdns-net-lb"
  load_balancer_type = "network"
  internal           = false
  security_groups    = [aws_security_group.dadsdns_lb_sg.id]
  subnets            = aws_subnet.public_subnet[*].id
  depends_on         = [aws_internet_gateway.igw_vpc]
}

# Target Group for Load Balancer
resource "aws_lb_target_group" "dadsdns-tg" {
  for_each = local.lb_ports
  name     = "dadsdns-${each.key}-tg"
  port     = each.value.target_port
  protocol = each.value.protocol
  vpc_id   = aws_vpc.custom_vpc.id
  target_type = "instance"
  health_check {
    protocol            = "TCP" # NLBs health check via TCP handshake
    port                = "53"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 10
  }
}

resource "aws_lb_listener" "dadsdns_listener" {
  for_each          = local.lb_ports
  load_balancer_arn = aws_lb.dadsdns_net_lb.arn
  port              = each.value.lb_port
  protocol          = each.value.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dadsdns-tg[each.key].arn
  }
}


#3. Launch Template for EC2 Instances
resource "aws_launch_template" "dadsdns_ec2_launch_template" {
  name = "dadsdns-server"

  image_id      = "<Your Technitian Master Image>" //Copy the ami id from aws console
  instance_type = "t3.small"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.dadsdns_ec2_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "dadsdns-ec2-server"
    }
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "dadsdns_asg" {
  name                = "dadsdns-server-asg"
  desired_capacity    = 2
  min_size            = 2
  max_size            = 3

  vpc_zone_identifier = aws_subnet.private_subnet[*].id

  launch_template {
    id      = aws_launch_template.dadsdns_ec2_launch_template.id
    version = "$Latest"
  }

  health_check_type = "EC2"
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  for_each               = local.lb_ports
  autoscaling_group_name = aws_autoscaling_group.dadsdns_asg.id
  lb_target_group_arn    = aws_lb_target_group.dadsdns-tg[each.key].arn
}

# integrate with route53
# 1. Fetch your existing Route 53 Hosted Zone
data "aws_route53_zone" "primary" {
  name         = "<your site name>." 
  private_zone = false
}

# 2. Route 53 Alias Record pointing to the LB
resource "aws_route53_record" "lb_dns" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "://family.<your site name>" 
  type    = "A"

  alias {
    name                   = aws_lb.dadsdns_net_lb.dns_name
    zone_id                = aws_lb.dadsdns_net_lb.zone_id
    evaluate_target_health = true
  }
}

output "alb_dns_name" {
  value = aws_lb.dadsdns_net_lb.dns_name
}