data "google_container_engine_versions" "zone" {
  zone = "${var.zone}"
}

resource "google_container_cluster" "cluster" {
  name               = "${var.name}"
  zone               = "${var.zone}"
  min_master_version = "${var.min_master_version != "false" ? var.min_master_version : data.google_container_engine_versions.zone.default_cluster_version }"

  network    = "${var.network}"
  subnetwork = "${var.subnetwork}"

  monitoring_service = "${var.monitoring_service}"
  logging_service    = "${var.logging_service}"

  master_authorized_networks_config = "${var.master_authorized_networks_config}"

  remove_default_node_pool = true

  node_pool = [
    {
      name       = "default-pool"
      node_count = 0
    },
  ]

  lifecycle {
    ignore_changes = [
      "node_pool",
    ]
  }

  # addons_config {
  #   kubernetes_dashboard {
  #     #disabled = "${var.kubernetes_dashboard == "true" ? "false" : "true"}"
  #   }
  # }

  #maintenance_policy {}
}

module "default" {
  source         = "bborysenko/gke-node-pool/google"
  version        = "0.1.0"
  name           = "default-pool"
  zone           = "${var.zone}"
  cluster        = "${var.name}"
  machine_type   = "n1-standard-1"
  min_node_count = "1"
  max_node_count = "1"
}
