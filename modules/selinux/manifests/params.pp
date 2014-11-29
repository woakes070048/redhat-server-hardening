## == Class: selinux::params
#
class selinux::params {

  $ensure           = 'absent'

  $default_packages = ['setroubleshoot']
  $default_services = ['setroubleshoot', 'mctrans']

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
  validate_array($packages)
  validate_array($services)
}
