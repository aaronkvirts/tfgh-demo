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

variable "zones" {
  type    = list(string)
  default = ["ap-southeast-3a", "ap-southeast-3b"]
}

variable "zoneid-A" {
}

variable "zoneid-B" {
}