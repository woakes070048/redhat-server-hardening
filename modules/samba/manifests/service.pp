# == Class: samba::service
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
#   ensures the samba service is [running/stopped]
#
class samba::service {

  service { $::samba::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }
}
