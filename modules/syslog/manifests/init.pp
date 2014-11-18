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
class syslog inherits syslog::params {

  class { '::syslog::install': } ->
  class { '::syslog::config': } ~>
  class { '::syslog::service': } ->
  Class['::syslog']
}
