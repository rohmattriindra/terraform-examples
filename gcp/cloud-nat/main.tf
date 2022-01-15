resource "google_compute_router" "routernat-geeks-prod-01" {
 name    = "routernat-geeks-prod-01"
 region  = "${var.region}"
 network = "${var.vpc_id}"
}

resource "google_compute_router_nat" "routernat-geeks-prod-01" {
 name                                = "routernat-geeks-prod-01"
 router                              = "${google_compute_router.routernat-geeks-prod-01.name}"
 region                              = "${var.region}"
 nat_ip_allocate_option	          = "AUTO_ONLY"
 source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
 min_ports_per_vm		              = 64
 tcp_established_idle_timeout_sec    = 1200
 tcp_transitory_idle_timeout_sec     = 30
 udp_idle_timeout_sec                = 30	
 icmp_idle_timeout_sec               = 30
}
