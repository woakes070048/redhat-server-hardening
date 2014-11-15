# == Class console::config
#
# This class is called from console
#
class console::config {

  file { 'securetty':
    ensure  => present,
    path    => $::console::params::securetty_config,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => $::console::params::securetty_template
  }

  file { 'console.perms':
    ensure => present,
    path   => $::console::params::console_perms_config
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => $::console::params::console_perms_template
  }

  ## Not required, but advised:

  # group { 'usergroup':
  #   ensure => present,
  # }

  # file { 'userhelper':
  #   ensure  => present,
  #   path    => $::console::params::userhelper_file,
  #   group   => 'usergroup',
  #   mode    => '4710',
  #   require => Group['usergroup'],
  # }
}
