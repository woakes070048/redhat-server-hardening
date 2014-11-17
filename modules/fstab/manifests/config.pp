# == Class module::config
#
# This class is called from module
#
class module::config {

  mounttab { '/mnt':
    ensure   => present,
    fstype   => 'nfs',
    atboot   => 'yes',
    options  => [ 'nosuid', 'noexec' ],
    provider => augeas,
  }

  mounttab { 'rem_nosuid':
  	fstype => ?,
  	option => nosuid,
  }

  mounttab { 'rem_nosuid':
  	fstype => ?,
  	option => nosuid,
  }

  
}
