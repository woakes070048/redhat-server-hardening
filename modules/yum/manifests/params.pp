## == Class: yum::params
#
class yum::params {

  $ensure           = 'latest'
  $services_ensure  = 'stopped'

  $default_packages = ['yum']
  $default_services = ['yum-updatesd']

  case $::osfamily {
    'RedHat': {
      $packages = $default_packages
      $services = $default_services
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  validate_string($ensure)
  validate_string($services_ensure)
  validate_array($packages)
  validate_array($services)
}
