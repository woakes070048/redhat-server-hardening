#
class password::params {

  $default_libuser_config     = '/etc/libuser.conf'
  $default_libuser_template   = 'password/libuser.conf.erb'

  case $::osfamily {
    'RedHat': {
      $libuser_config = $default_libuser_config
      $libuser_template = $default_libuser_template

      $checkusers_source = 'puppet:///files/password/checkusers.sh'
      # temporary until a more elegant approach can be created using augeas etc.
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
