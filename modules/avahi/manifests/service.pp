# == Class avahi::service
#
# This class is meant to be called from avahi
# It ensure the service is running
#
class avahi::service {

  service { $::avahi::service_name:
    ensure     => $::avahi::service_ensure,
    enable     => true,
    hasstatus  => true,
  }

  firewall { '000 handle avahi requests':
    proto  => 'udp',
    port   => '5353',
    action => $::avahi::params::firewall_action,
  }
}
