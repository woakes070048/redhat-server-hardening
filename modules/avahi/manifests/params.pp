# == Class avahi::params
#
# This class is meant to be called from avahi
# It sets variables according to platform
#
class avahi::params {

  $default_service_name    = $service_name
  $default_service_ensure  = $service_ensure
  $default_firewall_action = $firewall_action

  case $::osfamily {
    'RedHat': {
      $service_name    = 'avahi-daemon'
      $service_ensure  = 'absent'
      $firewall_action = 'drop'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
