# Support provisioning mirrorbrain with Apache as its webserver
#
class mirrorbrain::apache {

  class { '::apache':
    # We need a worker module for Apache, so the event worker module it id
    mpm_module => 'event',
  }

  include mirrorbrain::apache::debian
  contain('mirrorbrain::apache::debian')

  apache::mod { ['asn', 'autoindex_mb', 'dbd', 'form', 'geoip', 'mirrorbrain']: }
}
