## == Class: $module_name::params
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
class $module_name::params {

  $ensure           = 'absent'
  
  $default_packages = ['module']
  $default_services = ['module']

  case $::osfamily {
    'RedHat': {
      $packages = $default_packages
      $services = $default_services
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  validate_array($packages)
  validate_array($services)
}
