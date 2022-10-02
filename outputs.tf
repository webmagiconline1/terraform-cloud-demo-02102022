output "aws_s3_bucket_name" {
  description = "Outputing the bucket name"
  value       = aws_s3_bucket.example-s3-terraform.id
}