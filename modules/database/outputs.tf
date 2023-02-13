output "alicloud_rds_id" {
  value       = alicloud_db_instance.rds-ha.id
  description = "The ID associated to the RDS instance"
}

output "alicloud_rds_instance_private_ip" {
  value       = alicloud_db_instance.rds-ha.private_ip_address
  description = "The Private IP Address of the RDS instance"
}

output "alicloud_rds_instance_connection_string" {
  value       = alicloud_db_instance.rds-ha.connection_string
  description = "The Connection String of the RDS instance"
}