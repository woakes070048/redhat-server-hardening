# == Class audit::service
#
# This class is meant to be called from audit
# It ensure the service is running
#
class audit::service {

  service { $::audit::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
