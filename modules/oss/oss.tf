provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_oss_bucket" "oss_bucket" {
  acl           = "private"
  bucket        = "vs-test-bucket"
  storage_class = "IA"
}