data "google_compute_subnetwork" "subnets" {
  for_each = toset(data.google_compute_network.network.subnetworks)
  region   = var.region
  name     = each.value
}



