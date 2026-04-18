# =============================================================================
# SECURITY GROUP - FIREWALL DE REDE
# =============================================================================
module "sg_linuxtips_labs" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "~> 5.0"
  name        = "linuxtips-labs-sg"
  description = "Security Group para utilizacao nos laboratorios de estudo - Permite SSH, HTTP e HTTPS"
  vpc_id      = module.vpc_certificacao_devops.vpc_id

  # Usando regras prontas do módulo
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress padrão (todo tráfego) já é o default do módulo se você usar egress_rules
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

  tags = {
    Terraform   = "true"
    Environment = "Linuxtips"
  }
}