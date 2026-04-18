# =============================================================================
# EC2 - ELASTIC COMPUTE CLOUD
# =============================================================================

# AMI Ubuntu 24.04 TLS: ami-0ec10929233384c7f
# AMI Debian 13: ami-0b75f821522bcff85
# O ID da AMI pode ser obtido via AWS CLI ou via console web AWS

module "ec2_linuxtips_labs" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "~> 6.0"
  name                        = "linuxtips-labs"
  ami                         = "ami-098e39bafa7e7303d"
  instance_type               = "t3.small"
  key_name                    = aws_key_pair.linuxtips_key_pair.key_name
  subnet_id                   = module.vpc_certificacao_devops.public_subnets[0]
  vpc_security_group_ids      = [module.sg_linuxtips_labs.security_group_id]
  associate_public_ip_address = true

  root_block_device = {
    volume_type = "gp3"
    volume_size = 20
  }

  tags = {
    Terraform   = "true"
    Environment = "Linuxtips"
  }
}