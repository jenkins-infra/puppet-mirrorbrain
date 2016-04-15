#
# Manage Debian-specific repositories/dependencies
class mirrorbrain::debian {
  include ::apt

  apt::source { 'apache-obs':
    comment  => 'http://mirrorbrain.org/docs/installation/debian/',
    location => 'http://download.opensuse.org/repositories/Apache:/MirrorBrain/xUbuntu_12.04/',
    repos    => '/',
    release  => '',
    key      => {
      id     => 'EDDDC98D96A0F8899AB07C789584A164BD6D129A',
      server => 'pgp.mit.edu',
    }
  }
}
