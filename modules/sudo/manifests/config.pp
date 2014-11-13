# == Class sudo::config
#
# This class is called from sudo
# It verifies the secure configuration of sudo
#
class sudo::config {

  file { '/etc/sudoers':
    ensure  => file,
    path    => $::sudo::params::config_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    source  => "puppet:///modules/${module_name}/sudoers",
    require => Class['sudo::install'],
  }

  if $::sudo::params::wheel_ensure == 'present' {
    pam { 'require wheel':
      ensure    => present,
      service   => 'system-auth',
      type      => 'auth',
      control   => 'required',
      module    => 'pam_wheel.so',
      arguments => 'use_uid',
      position  => 'after su/*[last()]',
    }
  }
}
