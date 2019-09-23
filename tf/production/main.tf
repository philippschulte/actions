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
    name    = "p2.boombumerang.com"
    comment = "Production"
  }

  backend {
    address = "1.2.3.4"
    name    = "localhost"
    port    = 80
  }

  backend {
    address = "1.2.3.4"
    name    = "localhost2"
    port    = 80
  }
}
