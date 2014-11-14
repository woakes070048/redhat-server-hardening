# == Class iptables::params
#
# This class is meant to be called from iptables
# It sets variables according to platform
#
class iptables::params {

  $iptables_ensure = 'present'

  case $::osfamily {
    'RedHat': {
      $package_name = 'iptables-services'
      $service_name = 'iptables'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
