# == Class: yum
#
class yum inherits yum::params {

  class { '::yum::install': } ->
  class { '::yum::config': } ~>
  class { '::yum::service': } ->
  Class['::yum']
}
