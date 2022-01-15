
# GKE cluster
resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 2 #3
  node_locations           = [var.node_locations] #due to there are several zone (list)
  network                  = var.network
  subnetwork               = var.subnetwork
  min_master_version       = var.master_version

  master_auth {
    # username = var.gke_username
    # password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.1.0.16/28"
    }

  ip_allocation_policy {
      cluster_secondary_range_name    = "pod"
      services_secondary_range_name   = "service"
  }

  master_authorized_networks_config {
    cidr_blocks {
        cidr_block   = "10.0.0.0/8"
        display_name = "private-1"
    }

    cidr_blocks {
        cidr_block   = "172.16.0.0/12"
        display_name = "private-2"
    }
  }
}


# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes
  version = "1.20.10-gke.2100"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = "e2-medium"
    # machine_type = "e2-small"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 4
  }

}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}
