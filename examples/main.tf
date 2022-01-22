provider "google" {
  project     = "veerahemannthnag"
  region      = "us-central1"
  }
provider "google-beta" {
  project     = "veerahemannthnag"
  region      = "us-central1"
  }


output "hello_world" {
  value = "Hello, World!"
}

/*
resource "random_id" "server" {
  byte_length = 8
}
*/
module "sql" {
  source = "../modules/cloudsql"
  cloudsql_user = var.cloudsql_user
  cloudsql_password = var.cloudsql_password
}


variable cloudsql_user {
  type        = string
  sensitive   = true
}
variable cloudsql_password {
  type        = string
  sensitive   = true
}

/*
output "radom_string" {
  value = random_id.server.id
}
/*
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
*/