# ECR repository URL
output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}



# VPC ID
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# Public subnet IDs
output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

# Private subnet IDs
output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}



# S3 bucket name
output "terraform_state_bucket_name" {
  description = "Terraform state bucket name"
  value       = module.s3_backend.bucket_name
}

# DynamoDB table name
output "terraform_locks_table_name" {
  description = "Terraform locks table name"
  value       = module.s3_backend.dynamodb_table_name
}