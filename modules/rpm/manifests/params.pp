## == Class: rpm::params
#
# See 'modules/puppet' documentation for more
# information on module parameters.
#
# == About: this module
#
# module type:
#   component
#
# conflicts with:
#   [  ]
#
# associated profiles/stacks:
#   'base'
#
# == About: this class
#
# description:
#   manages configuration of this module via parameters
#
class rpm::params {

  $default_log_file = '/var/log/puppet/rpm'

  case $::osfamily {
    'RedHat': {
      $log_file = $default_log_file
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # validate_variableType(rpm::params::$parameter)
}
