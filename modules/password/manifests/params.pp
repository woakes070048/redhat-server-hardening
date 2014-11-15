#
class password::params {

  $checkusers_source = "puppet:///files/${module_name}/checkusers.sh"
  # temporary until a more elegant approach can be created using augeas etc.

  $libuser_template   = "${module_name}/libuser.conf.erb"
  $default_libuser_config     = '/etc/libuser.conf'

  case $::osfamily {
    'RedHat': {
      $libuser_config = $default_libuser_config
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
