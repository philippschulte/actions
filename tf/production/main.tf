provider "fastly" {
  api_key = var.FASTLY_PRODUCTION_API_KEY
  version = "0.9.0"
}

resource "fastly_service_v1" "api-service-production-0p7ElaomsexoNHwdMbYJac" {
  activate = false
  name     = "Production"

  domain {
    name    = "production.boombumerang.com"
    comment = "Production"
  }

  domain {
    name    = "production-2.boombumerang.com"
    comment = "Production-2"
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
}

