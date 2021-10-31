  resource "google_storage_bucket_iam_member" "member" {
  for_each              = local.iam_roles
  bucket = each.value.bucketname // google_storage_bucket.default.name
  role = each.value.role  // "roles/storage.admin"
  member = each.value.account
    }


  
locals {
  iam_roles = {
    for x in var.iam_roles :
    "${x.role}/${x.bucketname}/${x.account}" => x
  }
}

variable "iam_roles" {
}