# == Class: selinux
#
class selinux inherits selinux::params {

  class { '::selinux::install': } ->
  class { '::selinux::config': } ~>
  class { '::selinux::service': } ->
  Class['::selinux']
}
