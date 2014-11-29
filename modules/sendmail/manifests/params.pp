## == Class: sendmail::params
#
class sendmail::params {

  $ensure           = 'absent'

  $default_packages = ['sendmail']
  $default_services = ['sendmail']

  case $::osfamily {
    'RedHat': {
      $packages = $default_packages
      $services = $default_services
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  validate_array($packages)
  validate_array($services)
}
