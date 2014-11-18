# == Class: logwatch
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
class logwatch inherits logwatch::params {

  class { '::logwatch::install': } ->
  class { '::logwatch::config': } ~>
  class { '::logwatch::service': } ->
  Class['::logwatch']
}
