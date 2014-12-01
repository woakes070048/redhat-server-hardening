#
class ldap::params {

  $ensure           = 'absent'

  $default_packages = ['openldap-servers', 'openldap-clients']
  $default_services = ['ldap']

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
