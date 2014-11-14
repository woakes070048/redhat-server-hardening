# == Class iptables::config
#
# This class is called from iptables
#
class iptables::config {

  file { '/etc/sysconfig/iptables':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }
}
