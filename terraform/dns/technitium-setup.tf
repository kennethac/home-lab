resource "technitium_server_settings" "technitium_settings" {
  forwarders         = ["1.1.1.3:53", "1.0.0.3:53"]
  forwarder_protocol = "Udp"
  recursion          = "AllowOnlyForPrivateNetworks"
}

resource "technitium_zone" "home_kenneth_ac" {
  name = "home.kenneth.ac"
  type    = "Primary"
  zone_transfer_tsig_key_names = ["default-tsig-key"]
  allow_transfer = ["192.168.85.0/24"]
}

resource "technitium_record" "laptop_home_kenneth_ac" {
  zone    = technitium_zone.home_kenneth_ac.name
  name    = "laptop.home.kenneth.ac"
  type    = "A"
  ttl     = 10
  value = "192.168.68.122"
}

resource "technitium_record" "desktop_home_kenneth_ac" {
  zone    = technitium_zone.home_kenneth_ac.name
  name    = "desktop.home.kenneth.ac"
  type    = "A"
  ttl     = 10
  value = "192.168.68.122"
}