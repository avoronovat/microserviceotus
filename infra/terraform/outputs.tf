output "external_ip_address_deploy" {
  value = yandex_compute_instance.deployment.network_interface.0.nat_ip_address
}

output "external_ip_address_stage" {
  value = yandex_compute_instance.stage.network_interface.0.nat_ip_address
}

output "external_ip_address_prod" {
  value = yandex_compute_instance.prod.network_interface.0.nat_ip_address
}

## The Ansible inventory file to ansible dir
resource "local_file" "AnsibleInventoryYML" {
  content = templatefile("./environments/deployment/inventory.yml.tmpl",
    {
      gitlab_ip = yandex_compute_instance.deployment.network_interface.0.nat_ip_address,
      stage_ip = yandex_compute_instance.stage.network_interface.0.nat_ip_address,
      prod_ip = yandex_compute_instance.prod.network_interface.0.nat_ip_address
    }
  )
  filename = "../ansible/inventory.yml"
}

resource "local_file" "AnsibleConfig" {
  content = templatefile("./environments/deployment/ansible.cfg.tmpl",
    {
      private_key_path = var.private_key_path
    }
  )
  filename = "../ansible/ansible.cfg"
}
