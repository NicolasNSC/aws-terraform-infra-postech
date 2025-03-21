resource "aws_eks_cluster" "cluster" {
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