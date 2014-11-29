# == Class: selinux::service
#
class selinux::service {

  if $::selinux::params::ensure == 'present' {
    $service_ensure = stopped
  } else {
    $service_ensure = running
  }

  service { $::selinux::params::services:
    ensure     => $service_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }
}
