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
    format             = "{ \"timestamp\": \"%t\", \"status_code\": \"%>s\", \"request_method\": \"%m\", \"uri\": \"%%{json.escape(req.url.path)}V\", \"query_string\": \"%%{json.escape(req.url.qs)}V\", \"duration\": \"%D\", \"domain\": \"%v\", \"tls_version\": \"%%{tls.client.protocol}V\", \"client_ip\": \"%h\", \"http2\": %%{fastly_info.is_h2}V, \"user_agent\": \"%%{json.escape(req.http.User-Agent)}V\", \"token_hash\": \"%%{var.partial_token_hash}V\" }"
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
