module "this" {
  source = "terraform-aws-modules/security-group/aws"

  create_sg         = false
  security_group_id = var.sg_id
  create = var.create

  ingress_with_self = [{ rule = "all-all" }]
  egress_rules      = ["all-all"]
  ingress_with_prefix_list_ids  = [
    { description              = "HTTPS over TCP"
      from_port                = 443
      to_port                  = 443
      protocol                 = "tcp"
      prefix_list_ids          = var.prefix_list_id
    },
    { description              = "SSH over TCP"
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      prefix_list_ids          = var.prefix_list_id
    },
    { description              = "NFS over TCP"
      from_port                = 2049
      to_port                  = 2049
      protocol                 = "tcp"
      prefix_list_ids          = var.prefix_list_id 
    },
    { description              = "Secure SMB over TCP"
      from_port                = 445
      to_port                  = 445
      protocol                 = "tcp"
      prefix_list_ids          = var.prefix_list_id
    },
    { description              = "SMB over TCP via NetBIOS"
      from_port                = 137
      to_port                  = 139
      protocol                 = "tcp"
      prefix_list_ids          = var.prefix_list_id
    },
    { description              = "SMB over UDP via NetBIOS"
      from_port                = 137
      to_port                  = 139
      protocol                 = "udp"
      prefix_list_ids          = var.prefix_list_id
    }
  ]


  tags = merge(
    var.tags
  )
}


  # ingress_with_cidr_blocks = [
  #   {
  #     from_port   = 443
  #     to_port     = 443
  #     protocol    = "tcp"
  #     description = "Admin port for web service"
  #     cidr_blocks = var.cloud_cluster_nodes_admin_cidr 
  #   },
  #   {
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "tcp"
  #     description = "Admin port for ssh"
  #     cidr_blocks = var.cloud_cluster_nodes_admin_cidr 
  #   }
  # ]
