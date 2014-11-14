# == Class: avahi
#
# Installs and configures avahi according to USGCB best practices
#
# == USGCB info
#
# LinuxGuide:
#	3.7.1.1
#	3.7.1.2
#	2.1.3.1.4
#
# CCERef#:
#	CCE-4365-3
#
class avahi (

  $service_name    = $::avahi::params::service_name
  $service_ensure  = $::avahi::params::service_ensure
  $firewall_action = $::avahi::params::firewall_action

) inherits avahi::params {

  verify_string($service_name)
  verify_string($service_ensure)
  verify_string($firewall_action)

  class { '::avahi::config': } ~>
  class { '::avahi::service': } ->
  Class['::avahi']
}
