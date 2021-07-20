# microserviceotus

1. Создаем инфраструктуру

1.1. Terraform
1.1.1. Создаем бакет в облаке, где будем хранить статус нашей инфраструктуры ./terraform/backet/
    - cd ./terraform/backet
    - terraform init
    - terraform apply -var-file terraform.tfvars
    на выходе получаем ./terraform/state.tf - бэкенд с хранением терраформ стейта в созданам бакете в облаке
1.1.2. Создаем инстансы (гитлаб, 2 стенда - стейдж и прод) +  накатываем используя ансибл роль с Гитлабом
    - cd ..
    - terraform init
    - terraform apply -var-file terraform.tfvars
    креды по умолчанию
    root
    5iveL!fe
    если не получается зайти в вебку гитлаба, то подключаемся по ssh и меняем пароль
     ssh -i <path_to_private.key> ubuntu@<gitlabci server ip>
     sudo gitlab-rake "gitlab:password:reset[root]"
