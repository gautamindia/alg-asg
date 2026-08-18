name = "asg"
ami_id = "ami-035827357e3c7e810"
instance_type = "t3.micro"
subnet_ids =  ["subnet-0fec5c982cd896d38", "subnet-0a8cb70c3a5e3a032"]
security_group_id = "sg-015a9768ce7165dc5"
min_size = 1
desired_capacity = 1
max_size = 3    





alb_name = "MyALB"
target_group_name = "MyTargetGroup"
vpc_id = "vpc-0a1b452f5303ea84c"
alb_subnet_ids = ["subnet-0fec5c982cd896d38", "subnet-0a8cb70c3a5e3a032", "subnet-0c2077fb8aac3294a" ]
alb_security_group_ids = ["sg-015a9768ce7165dc5"]



