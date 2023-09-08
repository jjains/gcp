provider "google" {
  project = "jkumarjain-demo"
}

resource "google_compute_network" "vpc_network" {
  name                    = "jj-demo-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "us_west1_sn" {
  name          = "jj-demo-custom-subnet"
  ip_cidr_range = "192.168.1.0/24"
  region        = "us-west1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "us_east1_sn" {
  name          = "jj-demo-custom-subnet"
  ip_cidr_range = "192.168.2.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}
