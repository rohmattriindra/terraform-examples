# resource "google_compute_backend_service" "default" {
#   name          = "backend-service"
#   health_checks = [google_compute_http_health_check.default.id]
#   enable_cdn  = false
#   cdn_policy {
#     signed_url_cache_max_age_sec = 7200
#   }
# }

# resource "google_compute_http_health_check" "default" {
#   name               = "health-check-svc-bar"
#   request_path       = "/"
#   check_interval_sec = 1
#   timeout_sec        = 1
# }


resource "google_compute_forwarding_rule" "default" {
  name       = "website-forwarding-rule"
  target     = google_compute_target_pool.default.id
  port_range = "80"
}

resource "google_compute_target_pool" "default" {
  name = "website-target-pool"
}