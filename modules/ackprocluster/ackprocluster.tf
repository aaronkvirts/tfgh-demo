provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_cs_managed_kubernetes" "ack_pro_cluster" {
  name         = "test_ACK_Pro_cluster_Zone_A"
  cluster_spec = "ack.pro.small"
  version      = "1.24.6-aliyun.1"
  timezone     = "Asia/Kuala_Lumpur"
  #worker_vswitch_ids = split(",", join(",", alicloud_vswitch.ack_node_zone_A.*.id))
  #pod_vswitch_ids    = split(",", join(",", alicloud_vswitch.ack_pods_zone_A.*.id))

  worker_vswitch_ids = [
    var.zoneA_node_vswitchid
  ]

  pod_vswitch_ids = [
    var.zoneA_pod_vswitchid
  ]

  new_nat_gateway      = true
  slb_internet_enabled = false
  load_balancer_spec   = "slb.s1.small"
  service_cidr         = "10.11.0.0/16"
  proxy_mode           = var.ack_kube-proxy_mode
  # Enable Ram Role for ServiceAccount
  enable_rrsa = true

  deletion_protection = false
  # unit:day
  control_plane_log_ttl        = 30
  control_plane_log_components = ["apiserver", "kcm", "scheduler"]
  # The components. 
  dynamic "addons" {
    for_each = var.cluster_addons
    content {
      name   = lookup(addons.value, "name", var.cluster_addons)
      config = lookup(addons.value, "config", var.cluster_addons)
    }
  }
}

resource "alicloud_cs_kubernetes_node_pool" "managed_node_pool" {
  name       = "Test_NodePool"
  cluster_id = alicloud_cs_managed_kubernetes.ack_pro_cluster.id
  # The node vSwitches of the new Kubernetes cluster. Specify one or more vSwitch IDs. The vSwitches must be in the zone specified by availability_zone. 
  #vswitch_ids = split(",", join(",", alicloud_vswitch.ack_node_zone_A.*.id))

  vswitch_ids = [
    var.zoneA_node_vswitchid,
    var.zoneA_db_vswitchid
  ]

  desired_size = 3

  management {
    max_unavailable = 1
    auto_repair     = true
    auto_upgrade    = false
  }

  #Container Runtime
  runtime_name    = "containerd"
  runtime_version = "1.5.13"

  instance_types       = ["ecs.c6.xlarge"]
  instance_charge_type = "PostPaid"

  # customize worker instance name
  # e.g. 192.168.59.176 and IPSubStringLen = 59176
  # node_name_mode      = "customized,<prefix>,IPSubStringLen,<suffix>"

  # The password that is used to log on to the cluster by using SSH.
  # OR key_name OR kms_encrypted_password
  password = "Virtua/4u"

  install_cloud_monitor = true

  image_type           = "AliyunLinux"
  system_disk_category = "cloud_efficiency"
  system_disk_size     = 40

  /**
  data_disks {
    category = "cloud_efficiency"
    size     = 20
  }
**/
}