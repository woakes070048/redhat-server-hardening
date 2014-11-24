# == Class: cron
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
class cron inherits cron::params {

  class { '::cron::install': } ->
  class { '::cron::config': } ~>
  class { '::cron::service': } ->
  Class['::cron']
}
