# 📌 Comandos úteis para este repositório
Este arquivo reúne comandos simples para facilitar o uso do projeto no dia a dia.

## 1) Gerar chave SSH com `ssh-keygen`
Use o comando abaixo para criar um par de chaves:

```bash
ssh-keygen -t ed25519 -C "gabriel@exemplo.com" -f ~/.ssh/linuxtips-labs
```

Esse comando cria dois arquivos:
- `~/.ssh/linuxtips-labs` → **chave privada**
- `~/.ssh/linuxtips-labs.pub` → **chave pública**

Depois, copie o conteúdo da chave pública:

```bash
cat ~/.ssh/linuxtips-labs.pub
```

E cole no campo `public_key` do arquivo `key-pair.tf` (no recurso já definido como exemplo).

Exemplo de formato esperado:

```hcl
public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAA..."
```

## 2) Comandos iniciais do Terraform
Fluxo recomendado para estudo:

```bash
terraform init
terraform plan
terraform apply
```

Quando terminar os estudos, remova tudo para evitar custos:

```bash
terraform destroy
```