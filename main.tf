module "network" {
  source        = "./network"
  vpc-cidr      = var.vpc-cidr
  public1-cidr  = var.public1-cidr
  public2-cidr  = var.public2-cidr
  private1-cidr = var.private1-cidr
  private2-cidr = var.private2-cidr
  az1           = var.az1
  az2           = var.az2
}

module "redis-rds" {
  source           = "./redis-rds"
  instance_class   = var.instance_class
  username-rds     = var.username-rds
  password-rds     = var.password-rds
  subnet_ids_rds   = [module.network.private_subnet_id1, module.network.private_subnet_id2]
  subnet_ids_redis = [module.network.private_subnet_id2]
  vpc_id           = module.network.vpc_id
}

module "LoadBalancer" {
  source           = "./LoadBalancer"
  subnets   = [module.network.private_subnet_id1, module.network.private_subnet_id2]
  target_id = aws_instance.tf_application.id
  vpc_id    = module.network.vpc_id
}