locals {
  component_name = "${var.component_prefix}-${var.component_name}-${var.component_postfix}"
  # image_tag      = trimspace(file("../../app/tag.txt"))
  repo_name      = "${var.ecr_repository_name}"
}