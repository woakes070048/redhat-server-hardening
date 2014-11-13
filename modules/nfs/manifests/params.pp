# == Class nfs::params
#
# This class is meant to be called from nfs
# It sets variables according to platform
#
class nfs::params {
  case $::osfamily {
    'RedHat': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
