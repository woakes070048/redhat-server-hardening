# == Class sudo::params
#
# This class is meant to be called from sudo
# It sets variables according to platform
#
class sudo::params {

  $wheel_ensure     = 'present'
  $default_config   = '/etc/sudoers'
  $default_template = "${module_name}/sudoers.erb"

  case $::osfamily {
    'RedHat': {
      $config_file     = $default_config
      $config_template = $default_template
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
