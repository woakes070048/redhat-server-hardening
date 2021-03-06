# == Class: rsyslog
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
class rsyslog inherits rsyslog::params {

  class { '::rsyslog::install': } ->
  class { '::rsyslog::config': } ~>
  class { '::rsyslog::service': } ->
  Class['::rsyslog']
}
