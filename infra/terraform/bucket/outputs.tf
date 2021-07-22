# имя бакета в облаке
output "bucket_name" {
  value = yandex_storage_bucket.infrastructure.bucket
}
# айди ключа доступа
output "bucket_access_key" {
  value = yandex_storage_bucket.infrastructure.access_key
}
# секретный ключ доступа
output "bucket_secret_key" {
  value = yandex_storage_bucket.infrastructure.secret_key
}
# из шаблона собираем настройки бэкенда для хранения стейт файла
resource "local_file" "backend_bucket" {
  content = templatefile("state.tf.tmpl",
    {
      name       = yandex_storage_bucket.infrastructure.bucket,
      access_key = yandex_storage_bucket.infrastructure.access_key,
      secret_key = yandex_storage_bucket.infrastructure.secret_key
    }
  )
  filename = "../state.tf"
}
