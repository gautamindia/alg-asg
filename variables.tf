variable "alb_name" {
  type = string
}

variable "target_group_name" {
  type = string

}

variable "vpc_id" {
  type = string
}

variable "alb_subnet_ids" {
  type = list(string)
  
}

variable "alb_security_group_ids" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "min_size" {
  type    = number
 
}

variable "desired_capacity" {
  type    = number

}

variable "max_size" {
  type    = number
 
}

variable "default_instance_warmup" {
  type    = number
  default = 300
}
