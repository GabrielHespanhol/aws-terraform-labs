# 🚀 LinuxTips Labs - Terraform AWS Infrastructure

![Terraform](https://img.shields.io/badge/Terraform-v1.0+-623CE4?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-EC2-FF9900?style=for-the-badge&logo=amazon-aws)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

Criando uma infraestrutura básica na AWS utilizando Terraform.

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Recursos Criados](#-recursos-criados)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Uso](#-uso)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Variáveis](#-variáveis)
- [Outputs](#-outputs)
- [Custos](#-custos)
- [Segurança](#-segurança)
- [Troubleshooting](#-troubleshooting)
- [Contribuindo](#-contribuindo)
- [Referências](#-referências)

---

## 🎯 Sobre o Projeto

Este projeto foi desenvolvido especificamente para facilitar a criação de recursos básicos na AWS utilizando terraform.

### Objetivos

- ✅ Criar infraestrutura básica e funcional na AWS
- ✅ Facilitar o aprendizado através de comentários
- ✅ Seguir boas práticas

---

## 🏗️ Recursos Criados

Este projeto provisiona os seguintes recursos na AWS:

### 🌐 Rede (VPC)
- **VPC** com CIDR `10.0.0.0/16`
- **3 Subnets Públicas** (uma por AZ)
- **3 Subnets Privadas** (uma por AZ)
- **Route Tables** configuradas automaticamente

### 🔒 Segurança
- **Security Group** com regras para:
  - SSH (porta 22)
  - HTTP (porta 80)
  - HTTPS (porta 443)
- **Key Pair SSH** Criar uma key pair para acesso SSH ao EC2

### 💻 Computação
- **Instância(s) EC2** com:
  - Amazon Linux 2023
  - IP público

---

## 📦 Pré-requisitos

Antes de começar, você precisa ter instalado:

### 1. Terraform

```bash
# macOS (usando Homebrew)
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Linux (Ubuntu/Debian)
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Verificar instalação
terraform version
```

### 2. AWS CLI

```bash
# macOS
brew install awscli

# Linux
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Verificar instalação
aws --version
```

### 3. Credenciais AWS

Você precisa de uma conta AWS e credenciais configuradas:

```bash
# Configurar credenciais
aws configure

# Será solicitado:
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region name (ex: us-east-1)
# - Default output format (json)
```

**Como obter credenciais:**
1. Acesse o [Console AWS](https://console.aws.amazon.com/)
2. Vá para IAM (Identity and Access Management)
3. Crie um usuário ou use suas credenciais existentes
4. Gere Access Keys (chave de acesso)

⚠️ **Importante:** Nunca compartilhe suas credenciais AWS!

---

## 🚀 Instalação

### Passo 1: Clonar o Repositório

```bash
git clone https://github.com/seu-usuario/linuxtips-terraform-aws.git
cd linuxtips-terraform-aws
```

### Passo 2: Ajustar configurações

1. Criar sua chave SSH para acesso ao servidor, pode utilizar o comando de exemplo apontado no arquivo `COMANDOS.md`
2. Ajustar o conteúdo da chave SSH no arquivo key-pair.tf
3. Escolher a AMI a ser utilizada em ec2.tf, por padrão está o amazon linux 2023

### Passo 3: Inicializar o Terraform

```bash
# Baixar providers e módulos
terraform init
```

Você verá algo como:

```
Initializing modules...
Downloading terraform-aws-modules/vpc/aws...
Downloading terraform-aws-modules/security-group/aws...
Downloading terraform-aws-modules/ec2-instance/aws...

Terraform has been successfully initialized!
```

---

## 💡 Uso

### Comandos Básicos

#### 1️⃣ Verificar o que será criado

```bash
terraform plan
```

Este comando mostra sem executar quais recursos serão criados, modificados ou destruídos.

#### 2️⃣ Criar a infraestrutura

```bash
terraform apply
```

O Terraform pedirá confirmação. Digite `yes` para prosseguir.

⏱️ **Tempo estimado:** 3-5 minutos

#### 3️⃣ Ver outputs (informações úteis)

```bash
terraform output
```

Você verá informações como:
- IP público das instância

#### 4️⃣ Destruir tudo (quando terminar)

```bash
terraform destroy
```

⚠️ **IMPORTANTE:** Sempre destrua os recursos quando não estiver usando para evitar custos!

## 📁 Estrutura do Projeto

```
.
├── main.tf                      # Configuração do provider AWS
├── outputs.tf                   # Outputs consolidados
├── vpc.tf                       # Módulo de VPC
├── security-group.tf            # Módulo de Security Groups
├── key-pair.tf                  # Criação do par de chaves SSH
├── ec2.tf                       # Módulo de instâncias EC2
├── .gitignore                   # Arquivos ignorados pelo Git
├── README.md                    # Este arquivo
├── COMANDOS.md                  # Comandos úteis
└── AVISOS.md                    # Observações e cuidados importantes
```

### Descrição dos Arquivos

| Arquivo | Propósito |
|---------|-----------|
| `main.tf` | Define provider AWS, versões e data sources |
| `outputs.tf` | Define valores a serem exibidos após apply |
| `vpc.tf` | Cria VPC, subnets, Internet Gateway, NAT Gateway |
| `security-group.tf` | Define regras de firewall (ingress/egress) |
| `key-pair.tf` | Gera par de chaves SSH automaticamente |
| `ec2.tf` | Provisiona instâncias EC2 |

---

#### ⚠️ Sempre destrua quando não usar

```bash
terraform destroy
```

Recursos parados ainda geram custo (ex: NAT Gateway, EBS, Elastic IP).

### Monitorar Custos

1. Acesse [AWS Cost Explorer](https://console.aws.amazon.com/cost-management/home)
2. Configure alertas de billing

---

#### ❌ Terraform apply falha

```bash
# Limpar e reinicializar
rm -rf .terraform .terraform.lock.hcl
terraform init
terraform plan
```

### Comandos Úteis de Debug

```bash
# Ver logs do Terraform detalhados
TF_LOG=DEBUG terraform apply

# Validar sintaxe dos arquivos
terraform validate

# Formatar código
terraform fmt

# Ver estado atual
terraform show
```

---

## 🤝 Contribuindo

Contribuições e sugestões de melhorias são sempre apreciadas!

### Como Contribuir

1. Crie uma branch para sua feature 
2. Commit suas mudanças 
3. Push para a branch 
4. Abra um Pull Request

---

## 📚 Referências

### Documentação Oficial

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform AWS Modules](https://registry.terraform.io/namespaces/terraform-aws-modules)

### Módulos Utilizados

- [VPC Module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
- [Security Group Module](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest)
- [EC2 Instance Module](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)