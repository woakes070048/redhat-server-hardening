# == Class module::config
#
# This class is called from module
#
class module::config {

  # GuideSection 2.6.2.4.*
  # Configure default comprehensive rules
  file { '/etc/audit/audit.rules':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => $::auditd::params::rules_source,
  }

  kernel_parameter { 'audit':
    ensure       => present,
    value        => '1',
    array_append => true,
  }
}
