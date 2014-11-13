# == Class ssh::server::config
#
# This class is called from ssh
#
class ssh::server::config {

  file { $ssh::params::sshd_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    # content => template("${module_name}/sshd_config.erb"),
    require => Class['ssh::server::install'],
  }

  sshd_config { 'Protocol':
    ensure => present,
    value  => '2',
  }

  sshd_config { 'ClientAliveInterval':
    ensure => present,
    value  => '300',
  }

  sshd_config { 'ClientAliveCountMax':
    ensure => present,
    value  => '0'
  }

  sshd_config { 'IgnoreRhosts':
    ensure => present,
    value  => 'yes',
  }

  sshd_config { 'HostbasedAuthentication':
    ensure => present,
    value  => 'no',
  }

  sshd_config { 'PermitRootLogin':
    ensure => present,
    value  => 'no',
  }

  sshd_config { 'PermitEmptyPasswords':
    ensure => present,
    value  => 'no',
  }

  sshd_config { 'Banner /etc':
    ensure => present,
    value  => 'issue',
  }

  sshd_config { 'PermitUserEnvironment':
    ensure => present,
    value  => 'no',

  sshd_config { 'Ciphers':
    ensure => present,
    value  => 'aes128-ctr,aes192-ctr,aes256-ctr',
  }
}
