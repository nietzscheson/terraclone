resource "aws_secretsmanager_secret" "default" {
  name = local.name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "default" {
  secret_id     = aws_secretsmanager_secret.default.id
  secret_string = jsonencode({
    "AWS_ACCESS_KEY_ID": var.aws_access_key_id,
    "AWS_SECRET_ACCESS_KEY": var.aws_secret_access_key,
    "ALLOWED_HOSTS": var.allowed_hosts,
    "AWS_STORAGE_BUCKET_NAME" = aws_s3_bucket.default.id,
    "USE_S3" = true
  })
}