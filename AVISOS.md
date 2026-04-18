# ⚠️ Aviso importante sobre Terraform State
O Terraform State é o registro que o Terraform usa para saber quais recursos ele criou e como eles estão na cloud.

## Por que ele é utilizado?
Sem o state, o Terraform não consegue comparar o que está no código com o que já existe na infraestrutura.
Ele é essencial para comandos como `terraform plan`, `terraform apply` e `terraform destroy`.

## Quando não usamos estado remoto
Por padrão este repositório não utiliza backend remoto (ex.: S3), com isso o terraform criará o arquivo local `terraform.tfstate`.

## Não remova o `terraform.tfstate` antes do `destroy`
Se você apagar esse arquivo, o Terraform perde o controle dos recursos já criados.
Com isso, o `terraform destroy` não conseguirá remover corretamente a infraestrutura provisionada.

O fluxo ideal é:
1. Criar os recursos para praticar.
2. Finalizar os estudos.
3. Executar `terraform destroy` para evitar custos.