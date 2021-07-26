# microserviceotus

1. Создаем инфраструктуру

Terraform
1.1. Создаем бакет в облаке, где будем хранить статус нашей инфраструктуры ./terraform/backet/
    - cd ./terraform/backet
    - terraform init
    - terraform apply -var-file terraform.tfvars
    на выходе получаем ./terraform/state.tf - бэкенд с хранением терраформ стейта в созданам бакете в облаке
1.2. Создаем инстансы (гитлаб, 2 стенда - стейдж и прод - с докером и композом) +  накатываем используя ансибл роль с Гитлабом (ранером, докером и композом)
    - cd ..
    - terraform init
    - terraform apply -var-file terraform.tfvars
    креды по умолчанию
    root
    5iveL!fe
    если не получается зайти в вебку гитлаба, то подключаемся по ssh и меняем пароль
     ssh -i <path_to_private.key> ubuntu@<gitlabci server ip>
     sudo gitlab-rake "gitlab:password:reset[root]"
2. Подготовка работы с Gitlab CI/CD (переписать - все уже в одной репе!!!!!)
2.1. Грузим из стороннего гита или иного хранилища репу. (загружаем руками или еще как иначе)  - ПЕРЕДЕЛАТЬ
     just my way:
      - сделал форк в свой гитхаб из проекта демки микросервиса https://github.com/GoogleCloudPlatform/microservices-demo
      - получил токен для импорта в проекта в развернутый gitlab на deploy инстанса
      https://github.com/settings/tokens
      - импортировал репу только для демо-приложения (в нем нет .gitlab-ci.yml так что все равно придется все делать самому)
2.2. для импортированного проекта с демкой задаем ранчер в котором будут выполняться job-ы и происходить сборка
     - уходим в импортирвоанный форк проекта и открываем settings - ci/cd - runners
     - в разделе specific runners берем токкен
     - подставляем его в infra/ansible/reg_runner.yml
       cd infra/ansible
       ansible-playbook reg_runner.yml
     - раннер для выполнения пайплана проекта зареган
3.
