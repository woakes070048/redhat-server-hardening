# == Class: samba::config
#
# See 'modules/puppet' documentation for more
# information on module parameters.
#
# == About: this module
#
# module type:
#   component
#
# conflicts with:
#   [  ]
#
# associated profiles/stacks:
#
#
# == About: this class
#
# description:
#   manages structure and content of samba configuration
#
class samba::config {

  file { $::samba::params::config_file:
    ensure => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::samba::params::config_template)
  }

  /*
  This section requires modification of autofs, which ideally will be completed
  using augeasproviders. However, I don't believe that autofs is covered by the
  mounttab provider, and therefore a new provider may need to be written.

  As per guide section 3.18.2.11:
  Require Client SMB Packet Signing, if using mount.cifs

  mounttab { 'cifs-ensure-security':
    ensure   => present,
    device   => '?',
    fstype   => 'ext4',
    options  => 'sec=krb5i', # alternatively, "sec=ntlmv2i"
    provider => augeas
  }
  */
}
