# Reference the existing S3 bucket 
data "aws_s3_bucket" "source_bucket" {
  bucket = var.existing_s3_bucket_name
}

# IAM Role for the Backup Worker 
resource "aws_iam_role" "backup_lambda_role" {
  name = "cross-cloud-backup-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

# Least-Privilege Read Access 
resource "aws_iam_policy" "s3_read_only" {
  name        = "S3ReadOnlyBackupPolicy"
  description = "Allows read-only access to source S3 bucket"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Effect   = "Allow"
        Resource = [
          data.aws_s3_bucket.source_bucket.arn,
          "${data.aws_s3_bucket.source_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3" {
  role       = aws_iam_role.backup_lambda_role.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}