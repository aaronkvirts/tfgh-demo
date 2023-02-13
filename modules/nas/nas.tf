provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_nas_file_system" "nas" {
  #count = 2
  file_system_type = "standard"
  protocol_type    = "NFS"
  description      = "tf-testNAS"
  storage_type     = "Capacity"
  zone_id          = var.zoneid
  vpc_id           = var.vpcid
  vswitch_id       = var.zoneA_db_vswitchid
}