Examples:

terraform apply -target=module.iam_member
terraform destroy -target=module.iam_member

module "iam_member" {
    source  = "../modules/iam_member"
    iam_roles = [
        {
            bucketname           = "veerahemannthnag-998899999439"
            role             =  "roles/storage.admin"
            account         = "serviceAccount:account1@veerahemannthnag.iam.gserviceaccount.com"
        },
        {
            bucketname           = "veerahemannthnag-998899999439"
            role             =  "roles/storage.admin"
            account         = "serviceAccount:account2@veerahemannthnag.iam.gserviceaccount.com"
        },
        {
            bucketname           = "veerahemannthnag-9988999994394"
            role             =  "roles/storage.objectCreator"
            account         = "serviceAccount:account2@veerahemannthnag.iam.gserviceaccount.com"
        },
    ]
}


terraform apply -target=module.iam_binding
terraform destroy -target=module.iam_binding
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

