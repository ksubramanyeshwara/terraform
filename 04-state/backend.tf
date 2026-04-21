terraform {
    backend "s3" {
        bucket = "ks-demo-tf-backend"
        region = "ap-south-1"
        key = "demo/dev/terraform.tfstate"
        dynamodb_table = "tf-state-lock"
    }
}