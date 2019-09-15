provider "fastly" {
  api_key = var.FASTLY_PRODUCTION_API_KEY
  version = "0.9.0"
}

resource "fastly_service_v1" "api-serive-production-0p7ElaomsexoNHwdMbYJac" {
  name = "Production"

  domain {
    name    = "production.boombumerang.com"
    comment = "Production"
  }

  backend {
    address = "1.2.3.4"
    name    = "localhost"
    port    = 80
  }
}
