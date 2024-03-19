data "yandex_compute_image" "my_image" {
  family = var.instance_family_image
}

resource "yandex_compute_instance" "master" {
  name        = "master-host"
  hostname    = "master-host"
  platform_id = "standard-v3" # тип процессора (Intel Ice Lake)

  resources {
    core_fraction = 20 # Гарантированная доля vCPU
    cores         = 2  # vCPU
    memory        = 2  # RAM
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
      size     = 20
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.DevOps-subnet-a.id
    nat       = true # автоматически установить динамический ip
  }

  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}
# resource "yandex_compute_instance" "app" {
#   name        = "app-host"
#   hostname    = "app-host"
#   platform_id = "standard-v3" # тип процессора (Intel Ice Lake)

#   resources {
#     core_fraction = 20 # Гарантированная доля vCPU
#     cores         = 2  # vCPU
#     memory        = 2  # RAM
#   }

#   boot_disk {
#     initialize_params {
#       image_id = data.yandex_compute_image.my_image.id
#       size     = 20
#       type     = "network-ssd"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.DevOps-subnet-a.id
#     nat       = true # автоматически установить динамический ip
#   }

#   metadata = {
#     user-data = "${file("cloud-init.yaml")}"
#   }
# }

# resource "yandex_compute_instance" "srv" {
#   name        = "srv-host"
#   hostname    = "srv-host"
#   platform_id = "standard-v3" # тип процессора (Intel Ice Lake)

#   resources {
#     core_fraction = 20 # Гарантированная доля vCPU
#     cores         = 2  # vCPU
#     memory        = 2  # RAM
#   }

#   boot_disk {
#     initialize_params {
#       image_id = data.yandex_compute_image.my_image.id
#       size     = 20
#       type     = "network-ssd"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.DevOps-subnet-a.id
#     nat       = true # автоматически установить динамический ip
#   }

#   metadata = {
#     user-data = "${file("cloud-init.yaml")}"
#   }
# }
