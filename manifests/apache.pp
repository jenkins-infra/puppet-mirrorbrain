# Support provisioning mirrorbrain with Apache as its webserver
#
class mirrorbrain::apache {

  class { '::apache':
    # We need a worker module for Apache, so the event worker module it id
    mpm_module => 'event',
  }

  include mirrorbrain::apache::debian
  contain('mirrorbrain::apache::debian')

  apache::mod { ['mod_asn', 'mod_autoindex_mb', 'mod_dbd', 'mod_form', 'mod_geoip', 'mod_mirrorbrain']: }
}
