# == Class iptables::service
#
# This class is meant to be called from iptables
# It ensure the service is running
#
class iptables::service {

  service { $::iptables::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  service { 'iptables':
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => true,
    require   => Class['iptables::install'],
  }
}
