provider "fastly" {
  api_key = var.FASTLY_STAGING_API_KEY
  version = "0.11.0"
}

resource "fastly_service_v1" "api-service-staging-1SOF2sf218IFdLZhnqBlKB" {
  activate = true
  name     = "Staging"

  domain {
    name    = "www.action-demo-stag.com"
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
}
