variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC existente"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das sub-redes existentes"
  type        = list(string)
}

variable "node_group_config" {
  description = "Configuração do Node Group"
  type = object({
    instance_types = list(string)
    min_size       = number
    max_size       = number
    desired_size   = number
  })
  default = {
    instance_types = ["t3.medium"]
    min_size       = 1
    max_size       = 3
    desired_size   = 2
  }
}