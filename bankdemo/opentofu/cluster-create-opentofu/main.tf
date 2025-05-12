resource "kubectl_manifest" "cluster" {
  yaml_body = templatefile("${path.module}/wlcreate-330-mesh.yaml", {
    cluster_name              = var.cluster_name
    namespace                 = var.namespace
    k8s_version               = var.k8s_version
    cluster_class             = var.cluster_class
    control_plane_replicas    = var.control_plane_replicas
    worker_node_replicas_min  = var.worker_node_replicas_min
    worker_node_replicas_max  = var.worker_node_replicas_max
    vmclass-master            = var.vmclass-master
    vmclass-worker            = var.vmclass-worker
    storageclass              = var.storageclass
  })
}
