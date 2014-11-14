# == Class audit::params
#
# This class is meant to be called from audit
# It sets variables according to platform
#
class audit::params {

  $default_package_name = 'audit'
  $default_service_name = 'auditd'

  $default_x64_rules_source = 'puppet:///modules/audit/audit.rules.64'
  $default_x86_rules_source = 'puppet:///modules/audit/audit.rules.386'

  case $::osfamily {
    'RedHat': {
      $package_name = $default_package_name
      $service_name = $default_service_name
      $rules_source = $default_64_rules_source
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
