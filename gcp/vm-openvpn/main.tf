resource "google_compute_address" "static" {
  name = "public-ipv4-openvpn-server"
}

#create resource-vm
resource "google_compute_instance" "vm-openvpn" {
  name               = "vm-openvpn"
  machine_type	     = "e2-micro"
  project	           = "${var.project_id}"
  zone               = "${var.zone1}"
  tags		           = ["openvpn"]
  can_ip_forward     = "true"
    boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = "subnet-geeks-vm-production"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}