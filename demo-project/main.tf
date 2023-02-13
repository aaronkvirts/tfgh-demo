#Referred from 
#RDS - https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_instance
#Redis - https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/kvstore_instance
#NAS - https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/nas_file_system
#SLB - https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_load_balancer
#Note! - vSwitch will need to take a while to be deleted
terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.194.0"

    }
  }
}

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

data "alicloud_zones" "example" {
  multi = true
}

module "vpc" {
  source   = "../modules/vpc"
  zoneid-A = var.zones[0]
  zoneid-B = var.zones[1]
}

module "rds" {
  source        = "../modules/database"
  zoneid        = var.zones[0]
  zoneid_slaveA = var.zones[1]
  vpcid         = module.vpc.alicloud_vpc_id
  vswitchid     = module.vpc.alicloud_db_vswitch_zone_A_id
}

module "redis" {
  source           = "../modules/redis"
  zoneid           = var.zones[0]
  zoneid_secondary = var.zones[1]
  vswitchid        = module.vpc.alicloud_ack_node_vswitch_zone_A_id
}

module "ackprocluster" {
  source               = "../modules/ackprocluster"
  zoneA_db_vswitchid   = module.vpc.alicloud_db_vswitch_zone_A_id
  zoneA_node_vswitchid = module.vpc.alicloud_ack_node_vswitch_zone_A_id
  zoneA_pod_vswitchid  = module.vpc.alicloud_ack_pods_vswitch_zone_A_id
}

module "nas" {
  source             = "../modules/nas"
  zoneid             = var.zones[0]
  vpcid              = module.vpc.alicloud_vpc_id
  zoneA_db_vswitchid = module.vpc.alicloud_db_vswitch_zone_A_id
}

module "slb" {
  source              = "../modules/slb"
  zoneA_pod_vswitchid = module.vpc.alicloud_ack_pods_vswitch_zone_A_id
  zoneid-A            = var.zones[0]
  zoneid-B            = var.zones[1]
}

#SLB TO USE ALICLOUD_SLB_BACKEND_SERVER - https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_backend_server

module "oss_bucket" {
  source = "../modules/oss"
}