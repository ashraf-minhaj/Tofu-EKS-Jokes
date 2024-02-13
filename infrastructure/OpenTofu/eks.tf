resource "aws_eks_cluster" "cluster" {
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]

  version  = "1.28"
  name     = "${var.component_prefix}-${var.component_name}-cluster-${var.component_postfix}"
  role_arn = aws_iam_role.eks_control_plane_role.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids              = [aws_subnet.vpc_sub_az_a.id, aws_subnet.vpc_sub_az_b.id]
    public_access_cidrs     = ["0.0.0.0/0"]
    # for the cross-account elastic network interfaces that EKS creates to use 
    # to allow communication between worker nodes and the Kubernetes control plane.
    security_group_ids = [aws_security_group.worker_node_security_group.id]
  }

  #   kubernetes_network_config {
  #     service_ipv4_cidr = ""
  #     ip_family         = ""
  #   }

  tags = {
    app = "${var.component_prefix}"
    env = "${var.component_postfix}"
  }
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_control_plane_role.name
}


resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_control_plane_role.name
}