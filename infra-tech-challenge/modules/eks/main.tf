module "eks_example_eks-auto-mode" {
    source  = "terraform-aws-modules/eks/aws//examples/eks-auto-mode"
    version = "20.34.0"

    cluster_name    = var.cluster_name 
    cluster_version = var.cluster_version

    vpc_id          = var.vpc_id 
    subnet_ids      = var.subnet_ids 

    eks_managed_node_groups =  var.node_group_config
}