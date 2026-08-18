provider "aws" {
  region = "ap-south-1"
}

module "alb" {

    source = "./modules/alb"
    alb_name = var.alb_name
    target_group_name = var.target_group_name
    vpc_id = var.vpc_id
    
    alb_subnet_ids = var.alb_subnet_ids
    alb_security_group_ids = var.alb_security_group_ids
    
   
  

}
module "asg" {
    source = "./modules/asg"
    name = var.name
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_ids = var.subnet_ids
    security_group_id = var.security_group_id
    min_size = var.min_size
    desired_capacity = var.desired_capacity
    max_size = var.max_size
    
    
    target_group_name_asg = [module.alb.target_group_arn]
                            
    
  
}