# == Class kernel::params
#
# This class is meant to be called from kernel
# It sets variables according to platform
#
class kernel::params {

  $default_network_config = '/etc/sysconfig/network'

  case $::osfamily {
    'RedHat': {
      $network_config = $default_network_config
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
