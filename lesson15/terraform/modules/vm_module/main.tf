variable "subnets" {
  description = "List of subnets"
  type        = list(object({
    id     = string
    region = string
    zone   = string
    cidr   = string
  }))
  default = [
    {
      id     = "subnet-1"
      region = "us-central1"
      zone   = "us-central1-a"
      cidr   = "10.0.0.0/24"
    },
    {
      id     = "subnet-2"
      region = "us-central1"
      zone   = "us-central1-b"
      cidr   = "10.0.1.0/24"
    }
  ]
}

locals {
  selected_subnet = data.google_compute_subnetwork.subnets
}


resource "google_compute_instance" "vm" {
  name         = "example-vm"
  machine_type = var.machine_type
  zone         = var.zone
  image        = var.image_family
  image_project = var.image_project

  network_interface {
    network    = "default"
    subnetwork = local.selected_subnet[0].name
  }

  tags = ["web", "dev"]
}

output "vm_id" {
  value = google_compute_instance.vm.id
}

output "vm_private_ip" {
  value = google_compute_instance.vm.network_interface[0].network_ip
}

