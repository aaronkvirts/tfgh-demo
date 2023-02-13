output "alicloud_redis_id" {
  value       = alicloud_kvstore_instance.redis-dual-zone.id
  description = "The ID associated to the Redis instance"
}