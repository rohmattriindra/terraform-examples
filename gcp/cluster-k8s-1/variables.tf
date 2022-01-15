variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "cluster_name" {
  description = "k8s cluster name"
}

variable "node_locations" {
  description = "node location"
}

variable "network" {
  description = "vpc network"
}

variable "subnetwork" {
  description = "subnet"
}

variable "master_version" {
  description = "master version"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}
