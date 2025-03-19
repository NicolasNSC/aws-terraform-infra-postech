module "eks_example_eks-auto-mode" {
    source = "../../modules/eks"

    cluster_name = "tech-challenger-fast-food"
    cluster_arn = "arn:aws:iam::923490220058:role/LabRole"
    cluster_version = "1.28"

    node_iam_role_arn = "arn:aws:iam::923490220058:role/LabRole"

    vpc_id = "vpc-0f80825b69e116d0b"
    subnet_ids = [ "subnet-0eb13956d7c86f045", "subnet-0037daef0ef77e2a0", "subnet-0a974350f605374cf", "subnet-0e682e58572892245", "subnet-0d049fba3e2222cf4"]
}