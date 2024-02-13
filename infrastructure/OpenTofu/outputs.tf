# output "image" {
#     value = data.aws_ecr_image.service_image.image_tag
# }

output "subnets" {
  value = data.aws_subnets.default.ids
}

# output "lb_dns" {
#     value = aws_lb.load_balancer.dns_name
# }
