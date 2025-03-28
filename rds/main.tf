module "rds_db_instance" {
  source  = "terraform-aws-modules/rds/aws//modules/db_instance"
  version = "6.11.0"

  engine = "postgres"
  engine_version = "16.8"

  identifier = "tech-challenger-fast-food-db"
  # Recupera username e password do Secrets Manager
  username = jsondecode(data.aws_secretsmanager_secret_version.postech-fast-food_credentials.secret_string)["username"]
  password = jsondecode(data.aws_secretsmanager_secret_version.postech-fast-food_credentials.secret_string)["password"]
  
  publicly_accessible = true
  instance_class = "db.t4g.micro"  
  allocated_storage = 100
  backup_retention_period = 7
  storage_encrypted = false
  backup_window = "03:00-04:00"  
}

data "aws_secretsmanager_secret_version" "postech-fast-food_credentials" {
  secret_id = "postech-fast-food/credentials" # Nome do segredo criado no Secrets Manager
}