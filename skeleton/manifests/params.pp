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
class module::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'module'
      $service_name = 'module'
    }
    'RedHat', 'Amazon': {
      $package_name = 'module'
      $service_name = 'module'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # validate_variableType($module_name::params::$parameter)
}
