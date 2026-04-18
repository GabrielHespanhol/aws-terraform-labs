# =============================================================================
# KEY PAIR - PAR DE CHAVES SSH
# =============================================================================

# Você deve colar o valor de sua chave pública SSH no campo public_key
resource "aws_key_pair" "linuxtips_key_pair" {
  key_name   = "linuxtips-key-pair"
  public_key = "chave-ssh-aqui"

  tags = {
    Terraform   = "true"
    Environment = "Linuxtips"
  }
}
