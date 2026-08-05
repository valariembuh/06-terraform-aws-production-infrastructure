module "vpc" {

  source = "./modules/vpc"


  vpc_cidr = var.vpc_cidr

  public_subnet_a_cidr = var.public_subnet_a_cidr

  public_subnet_b_cidr = var.public_subnet_b_cidr


  availability_zone_a = var.availability_zone_a

  availability_zone_b = var.availability_zone_b

}


module "compute" {

  source = "./modules/compute"

  ami_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = module.vpc.public_subnet_a_id

  vpc_id = module.vpc.vpc_id

}



module "alb" {

  source = "./modules/alb"


  vpc_id = module.vpc.vpc_id


  subnet_ids = [

    module.vpc.public_subnet_a_id,

    module.vpc.public_subnet_b_id

  ]


  security_group_id = module.compute.security_group_id

}



module "autoscaling" {

  source = "./modules/autoscaling"


  ami_id = data.aws_ami.amazon_linux.id


  instance_type = var.instance_type


  security_group_id = module.compute.security_group_id


  vpc_zone_identifier = [

    module.vpc.public_subnet_a_id,

    module.vpc.public_subnet_b_id

  ]


  target_group_arn = module.alb.target_group_arn


  min_size = 2

  max_size = 4

  desired_capacity = 2

}
