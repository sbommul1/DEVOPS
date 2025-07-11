region        = "us-east-1"
environment   = "qa"

vpc_cidr_block        = "10.1.0.0/16"
public_subnet_cidrs   = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs  = ["10.1.3.0/24", "10.1.4.0/24"]

instance_type         = "t3.small"
db_instance_class     = "db.t3.small"

eks_node_group_size   = 3
