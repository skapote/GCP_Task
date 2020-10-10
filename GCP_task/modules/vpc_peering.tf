// vars

variable "dev_peering"{}

variable "prod_peering"{}

// peering

resource "google_compute_network_peering" "gcp-dev-peering" {
  name         = var.dev_peering
  network      = google_compute_network.dev_prj_vpc.id
  peer_network = google_compute_network.prod_prj_vpc.id
}

resource "google_compute_network_peering" "gcp-prod-peering" {
  name         = var.prod_peering
  network      = google_compute_network.prod_prj_vpc.id
  peer_network = google_compute_network.dev_prj_vpc.id
}