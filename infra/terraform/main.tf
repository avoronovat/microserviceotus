provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_image" "img_ubuntu" {
  name       = "ubuntu"
  source_family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "deployment" {
  name = "gitlabci"

  labels = {
    tags = "gitlabci"
  }
  resources {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.img_ubuntu.id}"
      size = 50
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

#  connection {
#      type  = "ssh"
#      host  = yandex_compute_instance.deployment.network_interface.0.nat_ip_address
#      user  = "ubuntu"
#      agent = false
#      # путь до приватного ключа
#      private_key = "${file(var.private_key_path)}"
#    }
  provisioner "local-exec" {
    command = "ansible-galaxy collection install -f ../ansible/requirements.yml"
  }
}
