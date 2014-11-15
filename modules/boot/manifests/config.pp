# == Class boot::config
#
# This class is called from boot
#
class boot::config {

  file { 'grub.conf':
    ensure => present,
    path   => $::boot::params::config_file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  shellvar { 'disable interactive boot':
    ensure   => present,
    target   => '/etc/sysconfig/init',
    variable => 'PROMPT',
    value    => 'no',
  }

  augeas { 'require password for single user mode':
    context => '/etc/inittab',
    lens    => 'inittab.lns',
    changes => [
      'set ~/runlevels S',
      'set ~/action wait',
      'set ~/process "/sbin/sulogin"',
    ],
  }
}
