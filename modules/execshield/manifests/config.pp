# == Class execshield::config
#
# This class is called from execshield
#
class execshield::config {

  sysctl { 'kernel.exec-shield':
    ensure => present,
    value  => '1',
  }

  sysctl { 'kernel.randomize_va_space':
    ensure => present,
    value  => '1',
  }
}
