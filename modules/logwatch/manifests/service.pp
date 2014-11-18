# == Class: logwatch::service
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
#   ensures the logwatch service is [running/stopped]
#
class logwatch::service {

  if $::logwatch::params::ensure == 'present' {
    service { $::logwatch::service_name:
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
