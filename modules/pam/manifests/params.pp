# == Class pam::params
#
# This class is meant to be called from pam
# It sets variables according to platform
#
class pam::params {

  $default_config_file   = '/etc/pam.conf'
  $default_config_source = "${module_name}/${module_name}.conf"
  $default_package_name = 'pam'

  case $::osfamily {
    'RedHat': {
      $config_file   = $default_config_file
      $config_source = $default_config_source
      $package_name  = $default_package_name
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
