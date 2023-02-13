output "alicloud_slb_id" {
  value       = alicloud_slb_load_balancer.default.id
  description = "The ID associated to the SLB instance"
}