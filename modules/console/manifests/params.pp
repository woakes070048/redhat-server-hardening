# == Class console::params
#
# This class is meant to be called from console
# It sets variables according to platform
#
class console::params {

  $securetty_template = "${module_name}/securetty"
  $console_perms_template = "${module_name}/console.perms"
  $default_securetty_config = '/etc/securetty'
  $default_console_perms_config = '/etc/security/console.perms'

  case $::osfamily {
    'RedHat': {
      $securetty_config = $default_securetty_config
      $console_perms_config = $default_console_perms_config
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
