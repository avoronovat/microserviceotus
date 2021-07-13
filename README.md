# microserviceotus

1. Создаем инфраструктуру

1.1. Terraform
1.1.1. Создаем бакет в облаке, где будем хранить статус нашей инфраструктуры ./terraform/backet/
    - cd ./terraform/backet
    - terraform init
    - terraform apply -var-file terraform.tfvars
    на выходе получаем ./terraform/state.tf - бэкенд с хранением терраформ стейта в созданам бакете в облаке
1.1.2. Создаем создаем
