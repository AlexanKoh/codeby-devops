terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "pacific-cargo-444022-b2"
  region  = "us-central1"
}


# Call the data module
module "data_module" {
  source       = "./modules/data_module"  # Путь к вашему модулю
  subnet_names = ["private-subnet", "public-subnet"]  # Список имен подсетей
  region       = "us-central1"  # Укажите регион, где находятся подсети
  vpc_id       = "custom-vpc"
}

# Call the VM module
module "vm_module" {
  source       = "./modules/vm_module"
  subnets      = module.data_module.subnets
  zone         = var.zone
  image_project = var.image_project
  image_family  = var.image_family
  machine_type  = "e2-micro"
}

