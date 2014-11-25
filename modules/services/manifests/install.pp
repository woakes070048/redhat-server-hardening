# == Class: services::install
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
#   ensures unecessary services aren't installed
#
class services::install {

  package { $::services::params::packages:
    ensure => absent
  }
}
