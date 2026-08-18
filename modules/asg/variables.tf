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
variable "target_group_name_asg" {
  type = list(string)
}