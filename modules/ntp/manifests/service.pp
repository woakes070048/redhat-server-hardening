# == Class template::service
#
# This class is meant to be called from template
# It ensure the service is running
#
class ntp::service {

  service { $::ntp::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
