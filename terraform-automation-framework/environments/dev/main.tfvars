region        = "us-east-1"
environment   = "dev"

vpc_cidr_block        = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]

instance_type         = "t2.micro"
db_instance_class     = "db.t3.micro"

eks_node_group_size   = 2
