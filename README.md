# Tofu-EKS-Jokes
 Powered by Terraform/OpenTofu & EKS, delivering a daily dose of tech-inspired laughter.

<div align="center">

<!-- ![banner](docs/banner.png) -->

![](https://img.shields.io/badge/Terraform-1.3.3-white?style=plastic&logo=terraform)&nbsp;
![](https://img.shields.io/badge/OpenTofu/Terraform-1.6.1-yellow?style=plastic&logo=opentofu)&nbsp;
![](https://img.shields.io/badge/docker--blue?style=plastic&logo=docker)&nbsp;
![](https://img.shields.io/badge/ECR--orange?style=plastic&logo=ecr)&nbsp;
![](https://img.shields.io/badge/Python-3.10-blue?style=plastic&logo=python)&nbsp;

</div>

## Steps to deploy to EKS Cluster
- [x] Create a cluster (Control Plane)
  - [x] VPC
  - [x] subnets 
  - [x] security group
  - [x] IAM assume role

- [x] Create a NodeGroup (worker Nodes)
  - [x] IAM role
  - [x] IAM policy
  - [ ] Launch Template

- [x] Deploy Pods
  - [x] deployment manifest
  - [x] service manifest (type: load balancer)

## Infrastructure As Code

### backend (chicken or the egg)
- [x] Create backend with
  - [x] states bucket
  - [x] ECR registry

### Others
- [ ] 