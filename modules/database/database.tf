provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_db_instance" "rds-ha" {
  category                 = "HighAvailability"
  engine                   = "PostgreSQL"
  engine_version           = "14.0"
  instance_charge_type     = "Postpaid"
  instance_name            = "Test_RDS_Instance"
  instance_type            = "pg.x2.medium.2c"
  db_instance_storage_type = "cloud_essd"
  instance_storage         = 20
  security_ips = [
    "172.16.0.0/16"
  ]
  vpc_id          = var.vpcid
  vswitch_id      = var.vswitchid
  zone_id         = var.zoneid
  zone_id_slave_a = var.zoneid_slaveA
  #monitoring_period = 5
}