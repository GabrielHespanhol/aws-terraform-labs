# =============================================================================
# KEY PAIR - PAR DE CHAVES SSH
# =============================================================================

# Você deve colar o valor de sua chave pública SSH no campo public_key
resource "aws_key_pair" "linuxtips_key_pair" {
  key_name   = "linuxtips-key-pair"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB0qGO86UtpESUp/1OuUEBtxb0F4p5qA3fHpMDlsH7Lx gabrielhespanhol@jedi"

  tags = {
    Terraform   = "true"
    Environment = "Linuxtips"
  }
}