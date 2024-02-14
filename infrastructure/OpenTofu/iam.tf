resource "aws_iam_role" "eks_control_plane_role" {
  name = "${var.component_prefix}-${var.component_name}-cluster-role-${var.component_postfix}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com",
      },
    }],
  })
}

resource "aws_iam_role" "worker_node_role" {
  name = "${var.component_prefix}-${var.component_name}-node-role-${var.component_postfix}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com",
      },
    }],
  })
}