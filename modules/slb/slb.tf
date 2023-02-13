provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name   = "tf-testLB"
  address_type         = "intranet"
  load_balancer_spec   = "slb.s1.small"
  internet_charge_type = "PayByTraffic"
  address_ip_version   = "ipv4"
  vswitch_id           = var.zoneA_pod_vswitchid
  master_zone_id       = var.zoneid-A
  slave_zone_id        = var.zoneid-B
  tags = {
    info = "TF test - for Intranet"
  }
}