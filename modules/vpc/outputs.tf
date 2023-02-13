output "alicloud_vpc_id" {
  value       = alicloud_vpc.prod.id
  description = "The ID associated to the VPC instance"
}

output "alicloud_db_vswitch_zone_A_id" {
  value       = alicloud_vswitch.db_zone_A.id
  description = "The ID associated to the zone A DB vSwitch instance"
}

output "alicloud_db_vswitch_zone_B_id" {
  value       = alicloud_vswitch.db_zone_B.id
  description = "The ID associated to the zone B DB vSwitch instance"
}

output "alicloud_public_vswitch_zone_A_id" {
  value       = alicloud_vswitch.public_zone_A.id
  description = "The ID associated to the zone A Public vSwitch instance"
}

output "alicloud_public_vswitch_zone_B_id" {
  value       = alicloud_vswitch.public_zone_B.id
  description = "The ID associated to the zone B Public vSwitch instance"
}

output "alicloud_ack_node_vswitch_zone_A_id" {
  value       = alicloud_vswitch.ack_node_zone_A.id
  description = "The ID associated to the zone A ACK Node vSwitch instance"
}

output "alicloud_ack_node_vswitch_zone_B_id" {
  value       = alicloud_vswitch.ack_node_zone_B.id
  description = "The ID associated to the zone B ACK Node vSwitch instance"
}

output "alicloud_ack_pods_vswitch_zone_A_id" {
  value       = alicloud_vswitch.ack_pods_zone_A.id
  description = "The ID associated to the zone A ACK Pods vSwitch instance"
}

output "alicloud_ack_pods_vswitch_zone_B_id" {
  value       = alicloud_vswitch.ack_pods_zone_B.id
  description = "The ID associated to the zone B ACK Pods vSwitch instance"
}