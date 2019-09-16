provider "fastly" {
  api_key = var.FASTLY_STAGING_API_KEY
  version = "0.9.0"
}

resource "fastly_service_v1" "api-service-staging-1SOF2sf218IFdLZhnqBlKB" {
  name = "Staging"

  domain {
    name    = "staging.boombumerang.com"
    comment = "Staging"
  }

  backend {
    address = "1.2.3.4"
    name    = "localhost"
    port    = 80
  }
}
