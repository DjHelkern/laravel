# Переменная определяющая зону для разворачивания ВМ
variable "zone" {                                                   # Используем переменную для передачи в конфиг инфраструктуры
  description = "CI/CD"                                             # Опционально описание переменной
  type        = list(string)                                        # Опционально тип переменной, коллекция последовательностей значения
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"] # Опционально значение переменной зоны расположения сервера, перечисленные по порядку для выбора
}

# Указываем какой имидж ОС использовать
variable "instance_family_image" {
  description = "Instance image"
  type        = string
  default     = "ubuntu-2004-lts" # или debian-11 или centos-7

}