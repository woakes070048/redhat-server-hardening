# == Class ssh::server::service
#
# This class is meant to be called from ssh
# It ensure the service is running
#
class ssh::server::service {

  service { $::ssh::params::server_service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['ssh::server::install']
    subscribe  => Class['ssh::server::config']
  }
}
