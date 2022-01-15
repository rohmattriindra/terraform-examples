resource "google_compute_ha_vpn_gateway" "ha-vpn-to-aws-geeks-1" {
  region   = "${var.region}"
  name     = "ha-vpn-to-aws-geeks-1"
  network  = "${var.vpc_id}"
}

resource "google_compute_vpn_tunnel" "tunnel1" {
  name          = "vpn-tunnel-geeks-aws-1"
  peer_ip       = "15.0.0.120"
  shared_secret = "KompaS2021"

  target_vpn_gateway = "ha-vpn-to-aws-geeks-1"

  depends_on = [
    google_compute_forwarding_rule.fr_esp,
    google_compute_forwarding_rule.fr_udp500,
    google_compute_forwarding_rule.fr_udp4500,
  ]
}

resource "google_compute_address" "vpn_static_ip" {
  name = "vpn-static-ip"
}


resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  ip_protocol = "ESP"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = "ha-vpn-to-aws-geeks-1"
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = "ha-vpn-to-aws-geeks-1"
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = "ha-vpn-to-aws-geeks-1"
}