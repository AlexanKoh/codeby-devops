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

resource "google_compute_firewall" "allow_ssh_to_private" {
  name    = "allow-ssh-to-private"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh-8080"]
}

resource "google_compute_firewall" "allow_8080_to_private" {
  name    = "allow-8080-to-private"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh-8080"]
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
  tags = ["allow-ssh-8080"]
}

output "public_vm_ip" {
  value = google_compute_instance.public_instance.network_interface[0].access_config[0].nat_ip
}