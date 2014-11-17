# == Class module::service
#
# This class is meant to be called from module
# It ensure the service is running
#
class module::service {

  service { $::module::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
