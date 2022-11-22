module "dev_cluster" {
    source       = "./deployment"
    env_name     = "dev"
    cluster_name = "clusterk8suspup"
    instance_type= "standard_d2_v2"
}
module "prod_cluster" {
    source       = "./deployment"
    env_name     = "prod"
    cluster_name = "clusterk8suspup"
    instance_type= "standard_d11_v2"
}