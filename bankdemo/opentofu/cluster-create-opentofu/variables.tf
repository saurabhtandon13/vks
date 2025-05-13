variable "cluster_name" {
  default = "demo-wl"
}

variable "namespace" {
  default = "autoapps"
}

variable "k8s_version" {
  default = "v1.32.0---vmware.6-fips-vkr.2"
}

variable "cluster_class" {
  default = "builtin-generic-v3.3.0"
}

variable "control_plane_replicas" {
  default = 1
}

variable "worker_node_replicas_min" {
  default = 1
}

variable "worker_node_replicas_max" {
  default = 5
}

variable "vmclass-master" {
  default = "k8s-master-small"
}

variable "vmclass-worker" {
  default = "k8s-worker-small"
}

variable "storageclass" {
  default = "vks-storage-policy"
}

# v1.32.0---vmware.6-fips-vkr.2
# v1.31.4---vmware.1-fips-vkr.3
