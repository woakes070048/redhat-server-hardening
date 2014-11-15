# == Class execshield::params
#
# This class is meant to be called from execshield
# It sets variables according to platform
#
class execshield::params {
  case $::osfamily {
    'RedHat': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
