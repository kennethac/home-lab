import {
  to = cloudflare_dns_record._dmarc_kennethchristensen_me_txt
  id = "${var.kennethchristensen_me_zone_id}/f997ab77b705f894979f08f61cc7ab46"
}

resource "cloudflare_dns_record" "_dmarc_kennethchristensen_me_txt" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "_dmarc"
  type    = "TXT"
  content = "\"v=DMARC1; p=quarantine\""
  ttl     = 120
  proxied = false
}

import {
  to = cloudflare_dns_record.cdn_lite_sacred_search_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/83727b70178a86eeae1659b28abac35b"
}

resource "cloudflare_dns_record" "cdn_lite_sacred_search_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "cdn"
  type    = "CNAME"
  content = "public.r2.dev"
  ttl     = 1
  proxied = true
}

import {
  to = cloudflare_dns_record.chat_cycle_bin_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/6e9e5e4427008d1fec1d9142414b918a"
}

resource "cloudflare_dns_record" "chat_cycle_bin_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "chat-cycle"
  type    = "CNAME"
  content = "na-west1.surge.sh"
  ttl     = 1
  proxied = false
}

import {
  to = cloudflare_dns_record.kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/0c8262d96f32408835dfa8f6fab3f520"
}

resource "cloudflare_dns_record" "kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "kennethchristensen"
  type    = "CNAME"
  content = "kennethchristensen.pages.dev"
  ttl     = 1
  proxied = true
}

import {
  to = cloudflare_dns_record.kennethchristensen_me_mx_20
  id = "${var.kennethchristensen_me_zone_id}/cb4c08c93ce4f346edb2ac192a5f28d0"
}

resource "cloudflare_dns_record" "kennethchristensen_me_mx_20" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "kennethchristensen"
  type    = "MX"
  content = "mailsec.protonmail.ch"
  priority = 20
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_dns_record.kennethchristensen_me_mx_10
  id = "${var.kennethchristensen_me_zone_id}/131b7baafcfc635fb27a9685033f00a0"
}

resource "cloudflare_dns_record" "kennethchristensen_me_mx_10" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "kennethchristensen"
  type    = "MX"
  content = "mail.protonmail.ch"
  priority = 10
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_dns_record.kennethchristensen_me_txt_1
  id = "${var.kennethchristensen_me_zone_id}/3c1457363c1944de97e36aff64ff7dfe"
}

resource "cloudflare_dns_record" "kennethchristensen_me_txt_1" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "kennethchristensen"
  type    = "TXT"
  content = "\"v=spf1 include:_spf.protonmail.ch ~all\""
  ttl     = 1
  proxied = false
}

import {
  to = cloudflare_dns_record.kennethchristensen_me_txt_2
  id = "${var.kennethchristensen_me_zone_id}/0217fcb940df8deb85bb86babe1545c0"
}

resource "cloudflare_dns_record" "kennethchristensen_me_txt_2" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "kennethchristensen"
  type    = "TXT"
  content = "\"protonmail-verification=dc955890c0f319638d34cf334e0c11f4d2ab92b9\""
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_dns_record.lite_sacredsearch_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/459afb0f2e58fc9b7a2cd9977d2a268f"
}

resource "cloudflare_dns_record" "lite_sacredsearch_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "lite"
  type    = "CNAME"
  content = "sacred-search-lite.pages.dev"
  ttl     = 1
  proxied = true
}

import {
  to = cloudflare_dns_record.nepali_bootcamp_audio_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/56290ea4a13a33cc020f9d95bba7a6b9"
}

resource "cloudflare_dns_record" "nepali_bootcamp_audio_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "nepali-bootcamp-audio"
  type    = "CNAME"
  content = "public.r2.dev"
  ttl     = 1
  proxied = true
}

import {
  to = cloudflare_dns_record.obsidian_links_kennethchristensen_me_aaaa
  id = "${var.kennethchristensen_me_zone_id}/ea5e771e68d89d49f17ac9103bdcd525"
}

resource "cloudflare_dns_record" "obsidian_links_kennethchristensen_me_aaaa" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "obsidian-links"
  type    = "AAAA"
  content = "100::"
  ttl     = 1
  proxied = true
}

import {
  to = cloudflare_dns_record.protonmail__domainkey_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/892a312f40ecc1d99da930dd083c1cfd"
}

resource "cloudflare_dns_record" "protonmail__domainkey_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "protonmail"
  type    = "CNAME"
  content = "protonmail.domainkey.dlgbvp6vsk4stgde7q7gl4phmx62niaezmjqe5babyqmkluvf7ysa.domains.proton.ch"
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_dns_record.protonmail2__domainkey_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/9d1c2f39a95914cc23de3219b0573a09"
}

resource "cloudflare_dns_record" "protonmail2__domainkey_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "protonmail2"
  type    = "CNAME"
  content = "protonmail2.domainkey.dlgbvp6vsk4stgde7q7gl4phmx62niaezmjqe5babyqmkluvf7ysa.domains.proton.ch"
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_dns_record.protonmail3__domainkey_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/c662f3f795183fa27920f181ea517708"
}

resource "cloudflare_dns_record" "protonmail3__domainkey_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "protonmail3"
  type    = "CNAME"
  content = "protonmail3.domainkey.dlgbvp6vsk4stgde7q7gl4phmx62niaezmjqe5babyqmkluvf7ysa.domains.proton.ch"
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_dns_record.sacredsearch_kennethchristensen_me_cname
  id = "${var.kennethchristensen_me_zone_id}/a44fbc03be5ccd610b8f9dd593048f1c"
}

resource "cloudflare_dns_record" "sacredsearch_kennethchristensen_me_cname" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "sacredsearch"
  type    = "CNAME"
  content = "sacred-search-lite.pages.dev"
  ttl     = 1
  proxied = true
}

import {
  to = cloudflare_dns_record.vday_kennethchristensen_me_a
  id = "${var.kennethchristensen_me_zone_id}/b9ebd8cfe686042aa97ff808d80a0932"
}

resource "cloudflare_dns_record" "vday_kennethchristensen_me_a" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "vday"
  type    = "A"
  content = "100.122.8.99"
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_dns_record.vday2026_kennethchristensen_me_a
  id = "${var.kennethchristensen_me_zone_id}/15d711a901d29e7079ccafa21f14f2ae"
}

resource "cloudflare_dns_record" "vday2026_kennethchristensen_me_a" {
  zone_id = var.kennethchristensen_me_zone_id
  name    = "vday2026"
  type    = "A"
  content = "100.122.8.99"
  ttl     = 60
  proxied = false
}
