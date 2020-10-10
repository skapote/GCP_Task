// vars

variable "gcp_project_region"{}

variable "gcp_protocol"{}

variable "gcp_ports"{}

// dev

variable "developer_project"{}

// prod

variable "production_project"{}


// Create a dev mode vpc

resource "google_compute_network" "dev_prj_vpc" {
  name = "vpc-dev"
  auto_create_subnetworks=false
  project= var.developer_project

}

// Create a prod mode vpc

resource "google_compute_network" "prod_prj_vpc" {
  name = "vpc-prod"
  auto_create_subnetworks=false
  project= var.production_project

}

// Create a dev subnet

resource "google_compute_subnetwork" "dev-prj-network" {
  name          = "dev-prj-subnet"
  ip_cidr_range = "10.10.1.0/24"
  region        = var.gcp_project_region
  network       = google_compute_network.dev_prj_vpc.id
  project= var.developer_project

}

// Create a prod subnet

resource "google_compute_subnetwork" "prod-prj-network" {
  name          = "prod-prj-subnet"
  ip_cidr_range = "10.10.2.0/24"
  region        = var.gcp_project_region
  network       = google_compute_network.prod_prj_vpc.id
  project= var.production_project

}

// Create a dev firewall

resource "google_compute_firewall" "firewall01" {
  name    = "dev-firewall"
  network = google_compute_network.dev_prj_vpc.name
  project= var.developer_project

  allow {
    protocol = var.gcp_protocol
  }

  allow {
    protocol = "tcp"
    ports    = var.gcp_ports
  }
}

// Create a prod firewall

resource "google_compute_firewall" "firewall02" {
  name    = "prod-firewall"
  network = google_compute_network.prod_prj_vpc.name
  project= var.production_project

  allow {
    protocol = var.gcp_protocol
  }

  allow {
    protocol = "tcp"
    ports    = var.gcp_ports
  }
}