variable "access_key" {
  type        = string
  description = "Access key"
  default     = "LTAI5tSKYBLxuxXxJVuzS9Yj"
}

variable "secret_key" {
  type        = string
  description = "Secret key"
  default     = "SWqBbq6ZJq1t1LCqMt8T1YTNcbgxi1"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "ap-southeast-3"
}

variable "zoneA_pod_vswitchid" {
}

variable "zoneA_node_vswitchid" {
}

variable "zoneA_db_vswitchid" {
}

variable "ack_kube-proxy_mode" {
  description = "Proxy mode of kube-proxy."
  type        = string
  default     = "ipvs"
}

variable "cluster_addons" {
  type = list(object({
    name   = string
    config = string
  }))

  default = [
    # CNI: Terway
    {
      "name" : "terway-eniip",
      "config" : "{\"IPVlan\":\"true\",\"NetworkPolicy\":\"true\",\"ENITrunking\":\"false\"}"
    },
    # CSI
    {
      "name"   = "csi-plugin",
      "config" = ""
    },
    {
      "name"   = "csi-provisioner",
      "config" = ""
    },
    {
      "name" : "logtail-ds",
      "config" : "{\"IngressDashboardEnabled\":\"true\"}"
    },
    {
      "name" : "ack-node-problem-detector",
      "config" : "{\"sls_project_name\":\"\"}"
    },
    # Ingress Controller
    {
      "name"   = "nginx-ingress-controller",
      "config" = "{\"IngressSlbNetworkType\":\"internet\",\"IngressSlbSpec\":\"slb.s2.small\"}"
    },
    {
      "name" : "ack-node-local-dns",
      "config" = ""
    },
    {
      "name" : "arms-prometheus",
      "config" = ""
    }
  ]
}