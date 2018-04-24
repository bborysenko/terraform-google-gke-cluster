output "name" {
  description = "Cluster name"
  value       = "${google_container_cluster.cluster.name}"
}
