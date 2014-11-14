# == Class kernel::config
#
# This class is called from kernel
#
class kernel::config {

  sysctl { 'net.ipv4.ip_forward':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.all.send_redirects':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.default.send_redirects':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.all.accept_source_route':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.all.accept_redirects':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.all.secure_redirects':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.all.log_martians':
    ensure => present,
    value  => 1,
  }

  sysctl { 'net.ipv4.conf.default.accept_source_route':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.default.accept_redirects':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.conf.default.secure_redirects':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
    ensure => present,
    value  => 1,
  }

  sysctl { 'net.ipv4.icmp_ignore_bogus_error_messages':
    ensure => present,
    value  => 1,
  }

  sysctl { 'net.ipv4.tcp_syncookies':
    ensure => present,
    value  => 1,
  }

  sysctl { 'net.ipv4.conf.all.rp_filter':
    ensure => present,
    value  => 1,
  }

  sysctl { 'net.ipv4.conf.default.rp_filter':
    ensure => present,
    value  => 1,
  }

  sysctl { 'net.ipv6.conf.default.accept_redirects':
    ensure => present,
    value  => 0,
  }

  sysctl { 'net.ipv6.conf.default.accept_ra':
    ensure => present,
    value  => 0,
  }

  shellvars { 'NOZEROCONF':
    target   => $::kernel::params::network_config,
    variable => 'NOZEROCONF',
    value    => 'yes',
  }
}
