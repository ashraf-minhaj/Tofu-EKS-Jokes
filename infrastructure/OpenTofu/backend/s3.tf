resource "aws_s3_bucket" "s3_bucket" {
  bucket        = local.s3_bucket
  force_destroy = false
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  depends_on = [aws_s3_bucket_public_access_block.s3_bucket_access_block]
  bucket     = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
  bucket     = aws_s3_bucket.s3_bucket.id
  # acl                     = "public-read"
  acl = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_access_block" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_objects_lifecyle" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    id     = "intelligent_tiering"
    status = "Enabled"
    transition {
      storage_class = "INTELLIGENT_TIERING"
    }
  }
}