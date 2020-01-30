provider "fastly" {
  api_key = var.FASTLY_PRODUCTION_API_KEY
  version = "0.11.0"
}

resource "fastly_service_v1" "api-service-production-0p7ElaomsexoNHwdMbYJac" {
  activate = false
  name     = "Production"

  domain {
    name    = "www.action-demo-prod.com"
    comment = "www"
  }

  domain {
comment = "apex"
  }

  backend {
    address               = "1.2.3.4"
    auto_loadbalance      = true
    between_bytes_timeout = 10000
    connect_timeout       = 1000
    error_threshold       = 0
    first_byte_timeout    = 15000
    max_conn              = 200
    ssl_check_cert        = true
    use_ssl               = false
    weight                = 100
    name                  = "localhost"
    port                  = 80
  }

  gcslogging {
    name               = join("", var.GCS_LOGGING_NAME)
    email              = "test@gmail.com"
    bucket_name        = "my_logs_bucket"
    secret_key         = join("", var.GCS_LOGGING_SECRET_KEY)
    path               = "production/"
    period             = 3600
    gzip_level         = 0
    format             = "%h %l %u %t \"%r\" %>s %b"
    timestamp_format   = "%Y-%m-%dT%H:%M:%S.000"
    response_condition = ""
    message_type       = "blank"
  }
}

output "active_version" {
  value = fastly_service_v1.api-service-production-0p7ElaomsexoNHwdMbYJac.active_version
}

output "cloned_version" {
  value = fastly_service_v1.api-service-production-0p7ElaomsexoNHwdMbYJac.cloned_version
}

output "service_id" {
  value = fastly_service_v1.api-service-production-0p7ElaomsexoNHwdMbYJac.id
}
