# =============================================================================
# TERRAFORM CONFIGURATION
# =============================================================================
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # OPCIONAL: Configuração do backend para armazenar o estado do Terraform
  # Descomente as linhas abaixo se quiser usar S3 como backend remoto
  # backend "s3" {
  #   bucket = "meu-bucket-terraform-state"
  #   key    = "certificacao-devops/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

# =============================================================================
# AWS PROVIDER CONFIGURATION
# =============================================================================
provider "aws" {
  region = "us-east-1" # Região AWS

  # Tags padrão que serão aplicadas a TODOS os recursos criados
  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "Linuxtips"
    }
  }
}