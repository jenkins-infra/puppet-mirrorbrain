#
# Manage Debian-specific repositories/dependencies
class mirrorbrain::debian {
  include ::apt

  $apt_repo = 'apache-obs'

  apt::source { $apt_repo:
    comment  => 'http://mirrorbrain.org/docs/installation/debian/',
    location => 'http://download.opensuse.org/repositories/home:/agentdero:/mirrorbrain/xUbuntu_14.04',
    repos    => '/',
    release  => '',
    key      => {
      id     => '77F11CCF1AFBE15388CE93239FAAEC7EA5638A16',
      server => 'pgp.mit.edu',
    },
    notify   => Exec['apt_update'],
  }

  package { ['mirrorbrain', 'mirrorbrain-tools', 'mirrorbrain-scanner']:
    ensure  => present,
    require => Apt::Source[$apt_repo],
  }

  package { ['geoip-bin', 'geoip-database']:
    ensure => present,
  }
}
