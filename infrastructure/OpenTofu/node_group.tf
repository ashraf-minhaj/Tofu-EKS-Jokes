resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.worker_node_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.worker_node_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.worker_node_role.name
}

resource "aws_eks_node_group" "node_group" {
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]

  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "${var.component_prefix}-${var.component_name}-node-group-${var.component_postfix}"
  node_role_arn   = aws_iam_role.worker_node_role.arn
  subnet_ids      = [aws_subnet.vpc_sub_az_a.id, aws_subnet.vpc_sub_az_b.id]
  capacity_type   = "ON_DEMAND"  # or SPOT
  ami_type        = "AL2_x86_64" # Specify the AMI type (AL2_x86_64 for Amazon Linux 2)
  instance_types  = ["t3.medium"]
  # disk_size = "50"

  # launch_template {

  # }

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  #   taint { # works with lauch templates
  #     version = "ec2 launch template version"
  #   }

  update_config {
    max_unavailable = 1 # Desired max number of unavailable worker nodes during node group update.
  }
}