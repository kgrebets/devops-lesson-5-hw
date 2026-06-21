# Create ECR repository
resource "aws_ecr_repository" "ecr_repository" {
  name = var.ecr_name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}