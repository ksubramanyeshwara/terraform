resource "aws_instance" "rmt-backend-instance" {
    instance_type = "t3.micro"
    ami = "ami-05d2d839d4f73aafb"
}

# resource "aws_s3_bucket" "tf-backend" {
#     bucket = "ks-demo-tf-backend"
# }

# Dynamodb configuration for state locking
resource "aws_dynamodb_table" "tf-state-lock" {
    name = "tf-state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}