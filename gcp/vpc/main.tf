#vpc
resource "google_compute_network" "vpc" {
  name                    = "${var.network}"
  auto_create_subnetworks = "false"
}
resource "google_compute_subnetwork" "subnet-1" {
  name          = "${var.subnetwork1}"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.1.100.0/23"
}
# Subnet
resource "google_compute_subnetwork" "subnet-2" {
  name          = "${var.subnetwork2}"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.1.106.0/23"
  secondary_ip_range {
    range_name    = "pod"
    ip_cidr_range = "10.49.0.0/21"
  }
  secondary_ip_range {
    range_name    = "service"
    ip_cidr_range = "192.168.1.0/24"
  }
}
resource "google_compute_subnetwork" "subnet-3" {
  name          = "${var.subnetwork3}"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.1.108.0/23"
  secondary_ip_range {
    range_name    = "pod"
    ip_cidr_range = "10.48.0.0/21"
  }
  secondary_ip_range {
    range_name    = "service"
    ip_cidr_range = "192.168.2.0/24"
  }
}
output "region" {
  value       = var.region
  description = "region"
}