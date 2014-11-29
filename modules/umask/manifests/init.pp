# == Class: umask
#
class umask {

  shellvar { 'UMASK':
    ensure => present,
    target => '/etc/sysconfig/init',
    value  => '027',
  }

  file { '/etc/profile':
    ensure => present,
    mode   => '0077'
  }

  file { '/etc/bashrc':
    ensure => present,
    mode   => '0077'
  }

  file { '/etc/csh.cshrc':
    ensure => present,
    mode   => '0077'
  }

  file { '/etc/csh.login':
    ensure => present,
    mode   => '0077'
  }

  file { '/etc/profile.d/*':
    ensure => present,
    mode   => '0077'
  }

  file { '/root/.bashrc':
    ensure => present,
    mode   => '0077'
  }

  file { '/root/.bash_profile':
    ensure => present,
    mode   => '0077'
  }

  file { '/root/.cshrc':
    ensure => present,
    mode   => '0077'
  }

  file { '/root/.tcshrc':
    ensure => present,
    mode   => '0077'
  }

  file { '/etc/login.defs':
    ensure => present,
    mode   => '0077'
  }

  Class['::umask']
}
