module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "20.34.0"

    cluster_name    = "tech-challenger-fast-food" 
    cluster_version = "1.29"

    vpc_id          = "vpc-0f80825b69e116d0b" 
    subnet_ids      = [ "subnet-0eb13956d7c86f045", "subnet-0037daef0ef77e2a0", "subnet-0a974350f605374cf", "subnet-0e682e58572892245", "subnet-0d049fba3e2222cf4"] 

    eks_managed_node_groups =  {
        tech-challenger-fast-food = {
            desired_capacity = 2
            max_capacity     = 3
            min_capacity     = 1
            instance_types   = ["t3.medium"]
            launch_template_name = "tech-challenger-fast-food"
        }
    }

    tags = {
        Environment = "production"
        Name = "tech-challenger-fast-food"
    }
}