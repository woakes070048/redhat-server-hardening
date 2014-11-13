# == Class puppet::config
#
# This class is called from puppet
#
class puppet::config {

  file { '/etc/puppet/puppet.conf':
    path  => $::puppet::params::config_file,
    owner => root,
    group => wheel,
    mode  => '0644',
    source => "puppet:///modules/${module_name}/puppet.conf",
  }
}
