module "vpc" {

  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr

  public_subnet_cidr = var.public_subnet_cidr

  availability_zone = var.availability_zone

}


module "compute" {

  source = "./modules/compute"

  ami_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = module.vpc.subnet_id

  vpc_id = module.vpc.vpc_id

}
