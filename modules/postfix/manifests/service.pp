#
class postfix::service {

  if $::postfix::params::ensure == 'present' {
    service { $::postfix::params::services:
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true
    }
  }  
}
