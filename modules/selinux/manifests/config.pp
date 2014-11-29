# == Class: selinux::config
#
class selinux::config {

  shellvar { 'SELINUX':
    ensure => present,
    target => '/etc/sysconfig/selinux',
    value  => 'enforcing'
  }

  shellvar { 'SELINUXTYPE':
    ensure => present,
    target => '/etc/sysconfig/selinux',
    value  => 'targeted'
  }
}
