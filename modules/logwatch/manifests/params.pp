## == Class: logwatch::params
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
class logwatch::params {

  $ensure => 'absent'

  case $::osfamily {
    'RedHat': {
      $package_name = 'logwatch'
      $service_name = 'logwatch'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  validate_string($logwatch::params::ensure)
}
