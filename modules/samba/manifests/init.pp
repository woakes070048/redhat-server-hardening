# == Class: samba
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
#
#
class samba inherits samba::params {

  class { '::samba::install': } ->
  class { '::samba::config': } ~>
  class { '::samba::service': } ->
  Class['::samba']
}
