output "vpc_id" {

  description = "ID of the VPC"

  value = module.vpc.vpc_id

}


output "subnet_id" {

  description = "ID of the public subnet"

  value = module.vpc.subnet_id

}


output "instance_id" {

  description = "ID of the EC2 instance"

  value = module.compute.instance_id

}

output "public_ip" {

  description = "Public IP of the web server"

  value = module.compute.public_ip

}


output "private_ip" {

  description = "Private IP of the web server"

  value = module.compute.private_ip

}


output "availability_zone" {

  description = "Availability Zone of the web server"

  value = module.compute.availability_zone

}
