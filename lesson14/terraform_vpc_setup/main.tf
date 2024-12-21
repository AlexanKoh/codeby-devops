provider "google" {
  credentials = file("key.json")
  project     = "pacific-cargo-444022-b2"
  region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name = "custom-vpc"
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_instance" "public_instance" {
  name         = "public-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.public_subnet.self_link
    access_config {
    }
  }
}

resource "google_compute_instance" "private_instance" {
  name         = "private-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.private_subnet.self_link
  }
}

output "public_vm_ip" {
  value = google_compute_instance.public_instance.network_interface[0].access_config[0].nat_ip
}

