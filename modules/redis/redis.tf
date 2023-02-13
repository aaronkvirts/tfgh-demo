provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_kvstore_instance" "redis-dual-zone" {
  db_instance_name = "Test_Redis_Instance"
  vswitch_id       = var.vswitchid
  security_ips = [
    "172.16.0.0/16"
  ]
  instance_type  = "Redis"
  engine_version = "5.0"
  #config = {
  #  appendonly             = "yes",
  #  lazyfree-lazy-eviction = "yes",
  #}
  #tags = {
  #  Created = "TF",
  #  For     = "Test",
  #}
  zone_id           = var.zoneid
  secondary_zone_id = var.zoneid_secondary
  instance_class    = "redis.master.small.default"
  payment_type      = "PostPaid"
}