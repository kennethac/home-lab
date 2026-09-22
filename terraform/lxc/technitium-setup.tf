resource "technitium_settings" "technitium_settings" {
  forwarders         = ["1.1.1.3", "1.0.0.3"]
  forwarder_protocol = "Tls"
  recursion          = "AllowOnlyForPrivateNetworks"
}

resource "technitium_zone" "kenneth_ac" {
  name = "kenneth.ac"
  type    = "Forwarder"
}

resource "technitium_record" "laptop_kenneth_ac" {
  zone    = "kenneth.ac"
  name    = "laptop.kenneth.ac"
  type    = "A"
  ttl     = 10
  value = "192.168.68.122"
}

resource "technitium_record" "desktop_kenneth_ac" {
  zone    = "kenneth.ac"
  name    = "desktop.kenneth.ac"
  type    = "A"
  ttl     = 10
  value = "192.168.68.122"
}