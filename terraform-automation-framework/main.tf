module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment          = var.environment
}

module "sg" {
  source      = "./modules/sg"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

module "ec2" {
  source            = "./modules/ec2"
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnets[0]
  security_group_id = module.sg.ec2_sg_id
  environment       = var.environment
}

module "rds" {
  source            = "./modules/rds"
  private_subnet_ids = module.vpc.private_subnets
  db_instance_class = var.db_instance_class
  db_username       = var.db_username
  db_password       = var.db_password
  db_sg_id          = module.sg.rds_sg_id
  environment       = var.environment
}

module "eks" {
  source            = "./modules/eks"
  subnet_ids        = module.vpc.private_subnets
  cluster_role_arn  = var.eks_cluster_role_arn
  cluster_role_name = var.eks_cluster_role_name
  node_role_arn     = var.eks_node_role_arn
  node_group_size   = var.eks_node_group_size
  environment       = var.environment
}

