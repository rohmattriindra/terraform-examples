# resource "google_compute_firewall" "allow-allow-https" {
#   name    = "${var.vpc_id}-allow-http"
#   network = "${var.vpc_id}"

#   allow {
#     protocol = "tcp"
#     ports = ["80","443"]
#   }
#   source_ranges = ["0.0.0.0/0"]
# }

# resource "google_compute_firewall" "allow-allow-gclb" {
#   name    = "${var.vpc_id}-allow-gclb"
#   network = "${var.vpc_id}"

#   allow {
#     protocol = "tcp"
#     ports = ["8080"] #disable netops port 5000
#   }
#   source_ranges = ["130.211.0.0/22","35.191.0.0/16"]
# }

resource "google_compute_firewall" "allow-allow-ssh" {
  name    = "${var.vpc_id}-allow-ssh"
  network = "${var.vpc_id}"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-allow-openvpn" {
  name    = "${var.vpc_id}-allow-openpvn"
  network = "${var.vpc_id}"

  allow {
    protocol = "udp"
    ports = ["1194"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-allow-dns" {
  name    = "${var.vpc_id}-allow-dns"
  network = "${var.vpc_id}"

  allow {
    protocol = "udp"
    ports = ["53"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-icmp" {
  name    = "${var.vpc_id}-allow-icmp"
  network = "${var.vpc_id}"

  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
}
