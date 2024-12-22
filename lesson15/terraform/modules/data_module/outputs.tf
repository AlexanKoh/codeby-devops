output "subnets" {
  value = [for subnet in data.google_compute_subnetwork.subnets : subnet.name]
}