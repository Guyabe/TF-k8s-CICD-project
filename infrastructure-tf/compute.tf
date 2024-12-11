module "kind_cluster_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                    = "kind-cluster"
  instance_type           = "t3.medium"
  key_name                = var.key_name
  monitoring              = true
  vpc_security_group_ids  = [aws_security_group.kind_cluster_sg.id]
  subnet_id               = element(module.vpc.public_subnets, 0)

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Project     = var.project_name
  }
}
