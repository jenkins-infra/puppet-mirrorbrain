# Class: mirrorbrain
# ===========================
#
class mirrorbrain {
  if $::osfamily != 'Debian' {
    fail('The mirrorbrain module currently only works on Debian hosts')
  }

  include mirrorbrain::debian

}
