# == Class template::params
#
# This class is meant to be called from template
# It sets variables according to platform
#
class template::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'template'
      $service_name = 'template'
    }
    'RedHat', 'Amazon': {
      $package_name = 'template'
      $service_name = 'template'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
