# == Class module::params
#
# This class is meant to be called from module
# It sets variables according to platform
#
class module::params {

  $default_config_file = '/etc/login.defs'

  case $::osfamily {
    'RedHat': {
      $config_file = $default_config_file
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
