#
class $module_name::service {

  if $::ldap::params::ensure == 'present' {
    service { $::$module_name::params::services:
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true
    }
  }
}
