# Class: mirrorbrain
# ===========================
#
class mirrorbrain {
  if $::osfamily != 'Debian' {
    fail('The mirrorbrain module currently only works on Debian hosts')
  }

  include mirrorbrain::debian

  cron { 'geoip-update':
    command => '/usr/bin/geoip-lite-update',
    user    => 'root',
    hour    => 4,
    minute  => 20,
  }
}
