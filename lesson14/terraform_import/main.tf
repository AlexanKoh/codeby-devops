provider "google" {
  credentials = file("key.json")
  project     = "pacific-cargo-444022-b2"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "imported_vm" {
  name         = "myvirt"
  machine_type = "e2-micro"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20241115"
    }
  }

  network_interface {
    network    = "https://www.googleapis.com/compute/v1/projects/pacific-cargo-444022-b2/global/networks/custom-vpc"
    subnetwork = "https://www.googleapis.com/compute/v1/projects/pacific-cargo-444022-b2/regions/us-central1/subnetworks/public-subnet"
    access_config {}
  }

  metadata = {
    ssh-keys = "xxxx"
  }
}

