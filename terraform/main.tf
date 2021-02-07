terraform {
  required_version = "~> 0.13"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "~> 2.0"
    }
  }
}

provider "keycloak" {
  url       = "http://keycloak:8080"
  client_id = "admin-cli"
  username  = "admin"
  password  = "admin"
}

resource "keycloak_realm" "master" {
  realm = "master"

  internationalization {
    supported_locales = [
      "ja",
      "en",
    ]
    default_locale = "ja"
  }
}

resource "keycloak_realm" "test_realm" {
  realm = "test_realm"

  internationalization {
    supported_locales = [
      "ja",
      "en",
    ]
    default_locale = "ja"
  }
}

resource "keycloak_user" "test_user" {
  realm_id = keycloak_realm.test_realm.id
  username = "mendako"
  enabled = true

  email = "Mendako@sample.email.address.io"
  first_name = "Opisthoteuthis"
  last_name = "Depressa"

}