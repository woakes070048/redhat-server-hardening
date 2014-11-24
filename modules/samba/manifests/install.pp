# == Class: samba::install
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
#   ensures samba package and necessary files are present
#
class samba::install {

  package { $::samba::params::package_name:
    ensure => $::samba::params::ensure
  }
}
