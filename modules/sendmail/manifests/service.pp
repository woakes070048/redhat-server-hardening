# == Class: $module_name::service
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
#   ensures the $module_name service is [running/stopped]
#
class $module_name::service {

  service { $::$module_name::params::services:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }
}
