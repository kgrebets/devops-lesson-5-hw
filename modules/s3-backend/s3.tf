//create an S3 bucket
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.bucket_name
}

//save the state of the S3 bucket with versioning enabled
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}