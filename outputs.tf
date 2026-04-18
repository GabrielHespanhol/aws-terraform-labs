# =============================================================================
# OUTPUTS - CONSOLIDADO
# =============================================================================

# -----------------------------------------------------------------------------
# VPC Outputs
# -----------------------------------------------------------------------------
output "vpc_info" {
  description = "Informações completas da VPC"
  value = {
    vpc_id          = module.vpc_certificacao_devops.vpc_id
    vpc_cidr        = module.vpc_certificacao_devops.vpc_cidr_block
    public_subnets  = module.vpc_certificacao_devops.public_subnets
    private_subnets = module.vpc_certificacao_devops.private_subnets
    nat_ips         = module.vpc_certificacao_devops.nat_public_ips
    azs             = module.vpc_certificacao_devops.azs
  }
}

# -----------------------------------------------------------------------------
# Security Group Outputs
# -----------------------------------------------------------------------------
output "security_group_info" {
  description = "Informações do Security Group"
  value = {
    sg_id   = module.sg_linuxtips_labs.security_group_id
    sg_name = module.sg_linuxtips_labs.security_group_name
  }
}

# -----------------------------------------------------------------------------
# EC2 Outputs
# -----------------------------------------------------------------------------
output "ec2_instances_info" {
  description = "Informações completas das instâncias EC2"
  value = {
    instance_ids = module.ec2_linuxtips_labs.id
    public_ips   = module.ec2_linuxtips_labs.public_ip
    private_ips  = module.ec2_linuxtips_labs.private_ip
    public_dns   = module.ec2_linuxtips_labs.public_dns
    az           = module.ec2_linuxtips_labs.availability_zone
  }
}