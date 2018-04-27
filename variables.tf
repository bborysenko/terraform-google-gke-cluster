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

# ----------------------------------------------------------------------------------------------------------------------
# Default node pool config
# ----------------------------------------------------------------------------------------------------------------------

variable "machine_type" {
  description = "Google Compute Engine machine type for default node pool"
  type        = "string"
  default     = "n1-standard-1"
}

variable "disk_size_gb" {
  description = "Size of the disk attached to each node in default pool"
  type        = "string"
  default     = "100"
}

variable "preemptible" {
  description = "Whether or not the underlying node VMs are preemptible in default pool"
  type        = "string"
  default     = "false"
}

variable "tags" {
  description = "Instance tags applied to all nodes in default pool to identify valid sources or targets for network firewalls"
  type        = "list"
  default     = []
}

variable "labels" {
  description = "The Kubernetes labels (key/value pairs) to be applied to each node in default pool"
  type        = "map"
  default     = {}
}

variable "taint" {
  # https://cloud.google.com/kubernetes-engine/docs/how-to/node-taints
  description = "Kubernetes taints to apply to each node in default pool"
  type        = "list"
  default     = []
}

# ----------------------------------------------------------------------------------------------------------------------
# Default node pool autoscale configuration
#
# https://cloud.google.com/kubernetes-engine/docs/concepts/cluster-autoscaler
# ----------------------------------------------------------------------------------------------------------------------

variable "min_node_count" {
  description = "Minimum number of nodes in default pool"
  type        = "string"
  default     = "1"
}

variable "max_node_count" {
  description = "Maximum number of nodes in default pool"
  type        = "string"
  default     = "1"
}

# ----------------------------------------------------------------------------------------------------------------------
# Default node pool management configuration
# ----------------------------------------------------------------------------------------------------------------------

variable "auto_repair" {
  # https://cloud.google.com/kubernetes-engine/docs/concepts/node-auto-repair
  description = "Sets Auto-Repair feature."
  type        = "string"
  default     = "false"
}

variable "auto_upgrade" {
  # https://cloud.google.com/kubernetes-engine/docs/concepts/node-auto-upgrades
  description = "Sets Auto-Upgrade feature."
  type        = "string"
  default     = "false"
}
