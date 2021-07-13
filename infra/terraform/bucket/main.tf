provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

# создание бакета для хранения стейта
resource "yandex_storage_bucket" "infrastructure" {
  access_key = "ea9aKWLPcjYdB7ainqGx"
  secret_key = "wJxH1Lv1k1em6OWrn732JVa0il4oNmDoQvj55N5H"
  bucket     = "infra.tfstate"
}
