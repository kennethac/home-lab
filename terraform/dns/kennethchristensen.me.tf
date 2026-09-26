locals {
  cname_records = {
    chat_cycle_bin = {
      name  = "chat-cycle"
      value = "na-west1.surge.sh"
      ttl   = 1
    }
    protonmail_domainkey = {
      name  = "protonmail"
      value = "protonmail.domainkey.dlgbvp6vsk4stgde7q7gl4phmx62niaezmjqe5babyqmkluvf7ysa.domains.proton.ch"
      ttl   = 60
    }
    protonmail2_domainkey = {
      name  = "protonmail2"
      value = "protonmail2.domainkey.dlgbvp6vsk4stgde7q7gl4phmx62niaezmjqe5babyqmkluvf7ysa.domains.proton.ch"
      ttl   = 60
    }
    protonmail3_domainkey = {
      name  = "protonmail3"
      value = "protonmail3.domainkey.dlgbvp6vsk4stgde7q7gl4phmx62niaezmjqe5babyqmkluvf7ysa.domains.proton.ch"
      ttl   = 60
    }
  }
  a_records = {
    tftest = {
      name  = "tftest"
      value = "8.8.8.8"
      ttl   = 60
    }
    vday = {
      name  = "vday"
      value = "100.122.8.99"
      ttl   = 60
    }
    vday2026 = {
      name  = "vday2026"
      value = "100.122.8.99"
      ttl   = 60
    }
  }
  txt_records = {
    protonmail_spf = {
      name  = "kennethchristensen"
      value = "\"v=spf1 include:_spf.protonmail.ch ~all\""
      ttl   = 1
    }
    protonmail_verification = {
      name  = "kennethchristensen"
      value = "\"protonmail-verification=dc955890c0f319638d34cf334e0c11f4d2ab92b9\""
      ttl   = 60
    }
  }
  mx_records = {
    protonmail_priority_20 = {
      name     = "kennethchristensen"
      value    = "mailsec.protonmail.ch"
      priority = 20
      ttl      = 60
    }
    protonmail_priority_10 = {
      name     = "kennethchristensen"
      value    = "mail.protonmail.ch"
      priority = 10
      ttl      = 60
    }
  }

  imported_a_records = {
    vday     = "b9ebd8cfe686042aa97ff808d80a0932"
    vday2026 = "15d711a901d29e7079ccafa21f14f2ae"
  }
  imported_cname_records = {
    chat_cycle_bin         = "6e9e5e4427008d1fec1d9142414b918a"
    protonmail_domainkey   = "892a312f40ecc1d99da930dd083c1cfd"
    protonmail2_domainkey  = "9d1c2f39a95914cc23de3219b0573a09"
    protonmail3_domainkey  = "c662f3f795183fa27920f181ea517708"
  }
  imported_mx_records = {
    protonmail_priority_20 = "cb4c08c93ce4f346edb2ac192a5f28d0"
    protonmail_priority_10 = "131b7baafcfc635fb27a9685033f00a0"
  }
  imported_txt_records = {
    protonmail_spf          = "3c1457363c1944de97e36aff64ff7dfe"
    protonmail_verification = "0217fcb940df8deb85bb86babe1545c0"
  }
}

resource "cloudflare_dns_record" "kennethchristensen_me_a_records" {
  for_each = local.a_records

  zone_id = var.kennethchristensen_me_zone_id
  name    = each.value.name
  type    = "A"
  content = each.value.value
  ttl     = each.value.ttl
  proxied = try(each.value.proxied, false)
  comment  = try(each.value.comment, "Managed by Terraform")
}

resource "cloudflare_dns_record" "cloudflare_cname_records" {
  for_each = local.cname_records

  zone_id = var.kennethchristensen_me_zone_id
  name    = each.value.name
  type    = "CNAME"
  content = each.value.value
  ttl     = each.value.ttl
  proxied = try(each.value.proxied, false)
  comment  = try(each.value.comment, "Managed by Terraform")
}
resource "cloudflare_dns_record" "cloudflare_txt_records" {
  for_each = local.txt_records

  zone_id = var.kennethchristensen_me_zone_id
  name    = each.value.name
  type    = "TXT"
  content = each.value.value
  ttl     = each.value.ttl
  proxied = try(each.value.proxied, false)
  comment  = try(each.value.comment, "Managed by Terraform")
}
resource "cloudflare_dns_record" "cloudflare_mx_records" {
  for_each = local.mx_records

  zone_id  = var.kennethchristensen_me_zone_id
  name     = each.value.name
  type     = "MX"
  content  = each.value.value
  priority = each.value.priority
  ttl      = each.value.ttl
  proxied  = try(each.value.proxied, false)
  comment  = try(each.value.comment, "Managed by Terraform")
}

import {
  for_each = local.imported_a_records
  to       = cloudflare_dns_record.kennethchristensen_me_a_records[each.key]
  id       = "${var.kennethchristensen_me_zone_id}/${each.value}"
}

import {
  for_each = local.imported_cname_records
  to       = cloudflare_dns_record.cloudflare_cname_records[each.key]
  id       = "${var.kennethchristensen_me_zone_id}/${each.value}"
}

import {
  for_each = local.imported_mx_records
  to       = cloudflare_dns_record.cloudflare_mx_records[each.key]
  id       = "${var.kennethchristensen_me_zone_id}/${each.value}"
}

import {
  for_each = local.imported_txt_records
  to       = cloudflare_dns_record.cloudflare_txt_records[each.key]
  id       = "${var.kennethchristensen_me_zone_id}/${each.value}"
}