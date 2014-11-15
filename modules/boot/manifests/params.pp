# == Class boot::params
#
# This class is meant to be called from boot
# It sets variables according to platform
#
class boot::params {

  $default_config_file = '/etc/grub.conf'

  case $::osfamily {
    'RedHat': {
      $config_file = $default_config_file
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
