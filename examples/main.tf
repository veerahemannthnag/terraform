terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.24"
}
/*
output "hello_world" {
  value = "Hello, World!"
}


resource "random_id" "server" {
  byte_length = 8
}


output "radom_string" {
  value = random_id.server.id
}
*/
module "iam_binding" {
    source  = "../modules/iam_binding"
    iam_roles = [
        {
            bucketname           = "veerahemannthnag-998899999439"
            role             =  "roles/storage.admin"
            account         = ["serviceAccount:account1@veerahemannthnag.iam.gserviceaccount.com","serviceAccount:account2@veerahemannthnag.iam.gserviceaccount.com"]
        },
        {
            bucketname           = "veerahemannthnag-9988999994394"
            role             =  "roles/storage.objectCreator"
            account         = ["serviceAccount:account2@veerahemannthnag.iam.gserviceaccount.com"]
        },
    ]
}