provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_vpc" "prod" {
  vpc_name   = "VPC-Prod"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "db_zone_A" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.1.0/24"
  zone_id      = var.zoneid-A
  vswitch_name = "db_zone_A_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}

resource "alicloud_vswitch" "db_zone_B" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.2.0/24"
  zone_id      = var.zoneid-B
  vswitch_name = "db_zone_B_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}

resource "alicloud_vswitch" "ack_node_zone_A" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.3.0/24"
  zone_id      = var.zoneid-A
  vswitch_name = "ack_node_zone_A_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}

resource "alicloud_vswitch" "ack_node_zone_B" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.4.0/24"
  zone_id      = var.zoneid-B
  vswitch_name = "ack_node_zone_B_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}

resource "alicloud_vswitch" "ack_pods_zone_A" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.5.0/24"
  zone_id      = var.zoneid-A
  vswitch_name = "ack_pods_zone_A_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}

resource "alicloud_vswitch" "ack_pods_zone_B" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.6.0/24"
  zone_id      = var.zoneid-B
  vswitch_name = "ack_pods_zone_B_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}

resource "alicloud_vswitch" "public_zone_A" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.7.0/24"
  zone_id      = var.zoneid-A
  vswitch_name = "public_zone_A_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}

resource "alicloud_vswitch" "public_zone_B" {
  vpc_id       = alicloud_vpc.prod.id
  cidr_block   = "172.16.8.0/24"
  zone_id      = var.zoneid-B
  vswitch_name = "public_zone_B_private_vswitch"
  depends_on = [
    alicloud_vpc.prod
  ]
}