output "alicloud_ack_id" {
  value       = alicloud_cs_managed_kubernetes.ack_pro_cluster.id
  description = "The ID associated to the ACK Pro cluster instance"
}

output "alicloud_nodepool_id" {
  value       = alicloud_cs_kubernetes_node_pool.managed_node_pool.id
  description = "The ID associated to the node pool under ACK Pro cluster instance"
}