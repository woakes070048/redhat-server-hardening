# == Class modprobe::service
#
# This class is meant to be called from modprobe
# It ensure the service is running
#
class modprobe::service {

  service { $::modprobe::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
