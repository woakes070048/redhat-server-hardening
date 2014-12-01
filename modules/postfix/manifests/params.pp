#
class postfix::params {

  $ensure              = 'present'

  $default_config_file = '/etc/postfix/main.cf/'
  $default_packages    = ['postfix']
  $default_services    = ['postfix']

  case $::osfamily {
    'RedHat': {
      $config_file = $default_config_file
      $packages    = $default_packages
      $services    = $default_services
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  validate_string($ensure)
  validate_array($packages)
  validate_array($services)
}
