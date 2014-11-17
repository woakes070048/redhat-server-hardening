# == Class nfs::service
#
# This class is meant to be called from nfs
# It ensures services supporting nfs are disabled unless needed
#
class nfs::service {

  service { 'nfslock':
    enable => false,
    ensure => stopped,
  }

  service { 'rpcgssd':
    enable => false,
    ensure => stopped,
  }

  service { 'rpcidmapd':
    enable => false,
    ensure => stopped,
  }

  service { 'netfs':
    enable => false,
    ensure => stopped,
  }

  service { 'portmap':
    enable => false,
    ensure => stopped,
  }

  service { 'nfs':
    enable => false,
    ensure => stopped,
  }

  service { 'rpcsvcgssd':
    enable => false,
    ensure => stopped,
  }
}
