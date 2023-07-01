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