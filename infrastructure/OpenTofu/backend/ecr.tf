resource "aws_ecr_repository" "repository" {
  name                 = "${var.component_prefix}-${var.component_name}-${var.ecr_repository_name}"
  image_tag_mutability = "MUTABLE" # mutable = changeable, immmutable is opposite of this
  force_delete         = false

  # image_scanning_configuration {
  #     scan_on_push    = true
  # }

  tags = {
    app = "${var.component_prefix}"
    env = "${var.component_postfix}"
  }
}

resource "aws_ecr_repository_policy" "my_repository_policy" {
  repository = aws_ecr_repository.repository.name

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:PutImage"
      ]
    }
  ]
}
EOF
}
