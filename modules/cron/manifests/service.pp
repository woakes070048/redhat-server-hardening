# == Class: cron::service
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
#   ensures the cron service is [running/stopped]
#
class cron::service {

  service { $::cron::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }

  service { 'atd':
    ensure     => stopped,
    enable     => false,
    hasstatus  => true,
    hasrestart => true
  }
}
