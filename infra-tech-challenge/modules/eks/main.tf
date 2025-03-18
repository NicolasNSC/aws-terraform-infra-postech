module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "20.34.0"

    cluster_name    = var.cluster_name 
    cluster_version = "1.28" 

    vpc_id          = var.vpc_id 
    subnet_ids      = var.subnet_ids 


    eks_managed_node_groups =  var.node_group_config
}