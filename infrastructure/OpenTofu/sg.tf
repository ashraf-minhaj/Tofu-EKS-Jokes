resource "aws_security_group" "worker_node_security_group" {
  name        = "${var.component_prefix}-${var.component_name}-worker-node-sg-${var.component_postfix}"
  description = "Public internet access"
  vpc_id      = data.aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = [22, 80, 8080]
    iterator = port
    content {
      description = "Allow inbound traffic"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-ingress-sgr
      # security_groups = [aws_security_group.lb_security_group.id]
    }
  }
  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:no-public-egress-sgr
  }

  tags = {
    Name      = "${var.component_prefix}-${var.component_name}-worker-node-sg-${var.component_postfix}"
    Role      = "public"
    ManagedBy = "opentofu"
    app       = "${var.component_prefix}"
    env       = "${var.component_postfix}"
  }
}