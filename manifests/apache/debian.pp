# Support provisioning mirrorbrain with Apache on debian
#
class mirrorbrain::apache::debian {
  include ::apache
  include mirrorbrain::debian

  package { ['libapache2-mod-mirrorbrain',
            'libapache2-mod-autoindex-mb',
            'libapache2-mod-asn',
            'libapache2-mod-form',
            'libapache2-mod-geoip']:
    ensure  => latest,
    require => Apt::Source['apache-obs'],
  }
}
