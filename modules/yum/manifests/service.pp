# == Class: yum::service
#
class yum::service {

  service { $::yum::params::services:
    ensure     => $::yum::params::services_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }
}
