module "redshift" {
  source = "../../"
/*
  cluster_identifier      = "my-cluster"
  cluster_node_type       = "dc1.large"
  cluster_number_of_nodes = 1

  cluster_database_name   = "mydb"
  cluster_master_username = "mydbuser"
  cluster_master_password = "MySecretPassw0rd"
*/
  #subnets                = module.vpc.redshift_subnets
  #vpc_security_group_ids = [module.sg.security_group_id]

  #  redshift_subnet_group_name = module.vpc.redshift_subnet_group
}