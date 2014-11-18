# == Class: $module_name::install
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
#   ensures $module_name package and necessary files are present
#
class module::install {

  package { $::module::package_name:
    ensure => present,
  }
}
