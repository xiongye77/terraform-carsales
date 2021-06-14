variable "region" {
     default = "ap-southeast-2"
}

variable "vpcCIDRblock" {
    default = "10.0.0.0/16"
}

variable "my_first_ecr_repo" {
    default = "my_first_ecr_repo"
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  default = "carsales"
}

variable "instance_type_spot" {
    default = "t2.medium"

}

variable "max_spot_instances" {
    default = 4

}

variable "min_spot_instances" {
    default = 2

}
# Make sure your bid price is enough. 
variable "spot_bid_price"  {
    default = "0.03"

}

