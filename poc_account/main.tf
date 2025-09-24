# Configure the AWS Provider
provider "aws" {
  region  = var.region
  profile = var.profile
}

################################################################################
# pamoncloud_controller Module
################################################################################
module "pamoncloud_controller" {
  source = "../"

  aws_subnet_id               = var.aws_subnet_id
  aws_ami_filter              = var.aws_ami_filter
  aws_image_id                = var.aws_image_id
  cluster_name                = var.cluster_name
  admin_email                 = var.admin_email
  admin_password              = var.admin_password
  dns_search_domain           = var.dns_search_domain
  dns_name_servers            = var.dns_name_servers
  ntp_server1_name            = var.ntp_server1_name
  cluster_disk_type           = var.cluster_disk_type
  cluster_disk_size           = var.cluster_disk_size
  aws_instance_type           = var.aws_instance_type
  aws_tags                    = var.aws_tags
  number_of_nodes             = var.number_of_nodes
  aws_instance_imdsv2         = var.aws_instance_imdsv2
  aws_disable_api_termination = var.aws_disable_api_termination
  rubrik_hosts_cidrs          = var.rubrik_hosts_cidrs
  aws_key_pair_name           = var.aws_key_pair_name

}
