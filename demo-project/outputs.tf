output "alicloud_rds_id" {
  value       = module.rds.alicloud_rds_id
  description = "The ID associated to the RDS instance"
}

output "alicloud_rds_instance_private_ip" {
  value       = module.rds.alicloud_rds_instance_private_ip
  description = "The Private IP Address of the RDS instance"
}

output "alicloud_rds_instance_connection_string" {
  value       = module.rds.alicloud_rds_instance_connection_string
  description = "The Connection String of the RDS instance"
}

output "alicloud_redis_id" {
  value       = module.redis.alicloud_redis_id
  description = "The ID associated to the Redis instance"
}

output "alicloud_ack_id" {
  value       = module.ackprocluster.alicloud_ack_id
  description = "The ID associated to the ACK Pro cluster instance"
}

output "alicloud_nodepool_id" {
  value       = module.ackprocluster.alicloud_nodepool_id
  description = "The ID associated to the node pool under ACK Pro cluster instance"
}

output "alicloud_nas_id" {
  value       = module.nas.alicloud_nas_id
  description = "The ID associated to the first NAS instance"
}

output "alicloud_slb_id" {
  value       = module.slb.alicloud_slb_id
  description = "The ID associated to the SLB instance"
}