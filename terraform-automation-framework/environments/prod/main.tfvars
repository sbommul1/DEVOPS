region        = "us-east-1"
environment   = "prod"

vpc_cidr_block        = "10.2.0.0/16"
public_subnet_cidrs   = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnet_cidrs  = ["10.2.3.0/24", "10.2.4.0/24"]

instance_type         = "t3.medium"
db_instance_class     = "db.t3.medium"

eks_node_group_size   = 4
