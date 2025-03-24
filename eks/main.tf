# Data source to check if the cluster already exists
data "aws_eks_cluster" "existing_cluster" {
  count = length(data.aws_eks_clusters.all.names) > 0 && contains(data.aws_eks_clusters.all.names, "tech-challenger-fast-food") ? 1 : 0
  name  = "tech-challenger-fast-food"
}

# Get all EKS clusters
data "aws_eks_clusters" "all" {}

resource "aws_eks_cluster" "cluster" {
  # Only create if the cluster doesn't exist
  count    = length(data.aws_eks_cluster.existing_cluster) == 0 ? 1 : 0
  name     = "tech-challenger-fast-food"
  role_arn = "arn:aws:iam::342519815167:role/LabRole"
  version  = "1.32"

  vpc_config {
    subnet_ids = [
      "subnet-0968bd024e0975f1f",
      "subnet-0d7ae3bef2fb4af21",
      "subnet-00884ae800db6de7d",
      "subnet-0d7e64289a3657fa5",
      "subnet-030ce91cfcbe8b0dd"
    ]
    security_group_ids      = []
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = false
  }

  bootstrap_self_managed_addons = false

  zonal_shift_config {
    enabled = false
  }

  compute_config {
    enabled       = true
    node_pools    = ["general-purpose", "system"]
    node_role_arn = "arn:aws:iam::342519815167:role/LabRole"
  }

  kubernetes_network_config {
    elastic_load_balancing {
      enabled = true
    }
  }

  storage_config {
    block_storage {
      enabled = true
    }
  }
}

# Create a local resource to reference the cluster regardless of whether it was created or already existed
locals {
  cluster_name = length(data.aws_eks_cluster.existing_cluster) > 0 ? data.aws_eks_cluster.existing_cluster[0].name : (length(aws_eks_cluster.cluster) > 0 ? aws_eks_cluster.cluster[0].name : "")
  cluster_id   = length(data.aws_eks_cluster.existing_cluster) > 0 ? data.aws_eks_cluster.existing_cluster[0].id : (length(aws_eks_cluster.cluster) > 0 ? aws_eks_cluster.cluster[0].id : "")
}