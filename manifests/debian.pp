#
# Manage Debian-specific repositories/dependencies
class mirrorbrain::debian {
  include ::apt

  $apt_repo = 'apache-mirrorbrain-obs'

  apt::key { $apt_repo:
    ensure => present,
    id     => '77F11CCF1AFBE15388CE93239FAAEC7EA5638A16',
    server => 'pgp.mit.edu',
  }

  # Manually injecting an apt repo list file since apt::source doesn't want to
  # handle our "weird" OBS debian repository layout and on Ubuntu it tries very
  # hard to add "trusty" or whatever the codename is into the repos
  #
  # This repository is also using @rtyler's custom mirrorbrain updates for
  # later debian type hosts because upstream has yet to enable them
  file { "/etc/apt/sources.list.d/${apt_repo}.list":
    ensure  => present,
    content => 'deb http://download.opensuse.org/repositories/home:/agentdero:/mirrorbrain/xUbuntu_14.04 /',
    owner   => 'root',
    group   => 'root',
    require => Apt::Key[$apt_repo],
    notify  => Exec['apt_update'],
  }

  package { ['mirrorbrain', 'mirrorbrain-tools', 'mirrorbrain-scanner']:
    ensure  => present,
    require => [
      File["/etc/apt/sources.list.d/${apt_repo}.list"],
      Class['Apt::Update'],
    ],
  }

  package { ['geoip-bin', 'geoip-database']:
    ensure => present,
  }
}
