# == Class modprobe::params
#
# This class is meant to be called from modprobe
# It sets variables according to platform
#
class modprobe::params {
  case $::osfamily {
    'RedHat': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
