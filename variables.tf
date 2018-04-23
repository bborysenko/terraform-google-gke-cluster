variable "name" {
  description = "The name of the cluster."
  type        = "string"
}

variable "zone" {
  description = "The zone in which the cluster resides."
  type        = "string"
}

variable "min_master_version" {
  type        = "string"
  default     = "false"
  description = "The minimum version of the master."
}

variable "network" {
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected"
  type        = "string"
  default     = "default"
}

variable "subnetwork" {
  description = "Name of the subnet to which to attach the cluster"
  type        = "string"
  default     = "default"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#monitoring_service
variable "monitoring_service" {
  description = "The monitoring service that the cluster should write metrics from pods to. Available options include monitoring.googleapis.com and none."
  type        = "string"
  default     = "monitoring.googleapis.com"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#logging_service
variable "logging_service" {
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com and none"
  type        = "string"
  default     = "logging.googleapis.com"
}

variable "master_authorized_networks_config" {
  type        = "list"
  default     = []
  description = "The desired configuration options for master authorized networks."
}

# ----------------------------------------------------------------------------------------------------------------------
# Addons config
# ----------------------------------------------------------------------------------------------------------------------

variable "kubernetes_dashboard" {
  type        = "string"
  default     = "false"
  description = "The status of the Kubernetes Dashboard add-on"
}
