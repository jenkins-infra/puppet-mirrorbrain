#
# Manage Debian-specific repositories/dependencies
class mirrorbrain::debian {
  include ::apt

  apt::key { 'apacheobs':
    id     => 'EDDDC98D96A0F8899AB07C789584A164BD6D129A',
    server => 'pgp.mit.edu',
  }

}
