provider "fastly" {
  api_key = var.FASTLY_PRODUCTION_API_KEY
  version = "0.11.0"
}

resource "fastly_service_v1" "api-service-production-0p7ElaomsexoNHwdMbYJac" {
  activate = false
  name     = "Production"

  domain {
    name = "www.altitude-ny.com"
  }

  backend {
    address = "1.2.3.4"
    name    = "localhost"
    port    = 80
  }
}
