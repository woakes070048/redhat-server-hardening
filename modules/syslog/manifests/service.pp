# == Class: syslog::service
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
#   [ 'rsyslog', 'syslog-ng' ]
#
# associated profiles/stacks:
#   'base::server::log'
#
# == About: this class
#
# description:
#   ensures the syslog service is [running/stopped]
#
class syslog::service {

  service { $::syslog::service_name:
    ensure     => $::syslog::params::ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
