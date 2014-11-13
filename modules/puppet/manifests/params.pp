# == Class puppet::params
#
# This class is meant to be called from puppet
# It sets variables according to platform
#
class puppet::params {
  case $::osfamily {
    'RedHat': {
      $package_name = 'puppet'
      $service_name = 'puppet'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
