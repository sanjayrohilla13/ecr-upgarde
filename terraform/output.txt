output "ecr-repo-name" {
  value = aws_ecr_repository.ecr-name.repository_url
}