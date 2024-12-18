module "ovia-vpc" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "ovia-ec2" {
  source   = "./modules/ec2"
  ami_id = "ami-036841078a4b68e14"
  subnet_id = module.ovia-vpc.pub_sub_ids[0]
}
