## == Class: cron::params
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
#   'base::server'
#
# == About: this class
#
# description:
#   manages configuration of this module via parameters
#
class cron::params {
  case $::osfamily {
    'RedHat': {
      $package_name = 'crond'
      $service_name = 'crond'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # validate_variableType(cron::params::$parameter)
}
