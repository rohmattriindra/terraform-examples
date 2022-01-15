# resource "google_dns_managed_zone" "internal-zone" {
#   name        = "internal-zone"
#   dns_name    = "geeksops.internal."
#   description = "Example private DNS zone"
#   labels = {
#     foo = "bar"
#   }

#   visibility = "private"

#   private_visibility_config {
#     networks {
#       network_url = "https://www.googleapis.com/compute/v1/projects/course-dev-01/global/networks/vpc-geeks-production"
#     }
#   }
# }


# resource "google_dns_record_set" "service-1_geeksops_internal_A" {
#   name = "service-1.geeksops.internal."
#   type = "A"
#   ttl  = 60

#   managed_zone = google_dns_managed_zone.internal-zone.name

#   rrdatas = ["172.25.10.11"]
# }

# resource "google_dns_record_set" "service-2_geeksops_internal_A" {
#   name = "service-2.geeksops.internal."
#   type = "A"
#   ttl  = 60

#   managed_zone = google_dns_managed_zone.internal-zone.name

#   rrdatas = ["10.10.10.15"]
# }

# resource "google_dns_record_set" "blue_geeksops_internal_A" {
#   name = "blue.geeksops.internal."
#   type = "A"
#   ttl  = 60

#   managed_zone = google_dns_managed_zone.internal-zone.name

#   rrdatas = ["10.1.106.6"]
# }

# resource "google_dns_record_set" "green_geeksops_internal_A" {
#   name = "green.geeksops.internal."
#   type = "A"
#   ttl  = 60

#   managed_zone = google_dns_managed_zone.internal-zone.name

#   rrdatas = ["10.1.106.6"]
# }

# resource "google_dns_record_set" "yellow_geeksops_internal_A" {
#   name = "yellow.geeksops.internal."
#   type = "A"
#   ttl  = 60

#   managed_zone = google_dns_managed_zone.internal-zone.name

#   rrdatas = ["10.1.106.6"]
# }
