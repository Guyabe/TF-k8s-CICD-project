resource "aws_s3_bucket" "s3_bucket" {
  bucket             = var.bucket_name
  object_lock_enabled = false  # Explicitly disable object lock

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowBucketOperations",
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::298169470255:role/voclabs"
        },
        Action = [
          "s3:GetBucketObjectLockConfiguration",
          "s3:PutBucketObjectLockConfiguration",
          "s3:GetBucketVersioning",
          "s3:PutBucketVersioning"
        ],
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}/*"
        ]
      }
    ]
  })
}
