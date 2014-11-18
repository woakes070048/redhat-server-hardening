# == Class: logwatch::install
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
#   'base'
#
# == About: this class
#
# description:
#   ensures logwatch package and necessary files are present
#
class logwatch::install {

  package { $::logwatch::package_name:
    ensure => $::logwatch::ensure,
  }

  file { '/etc/cron.daily/0logwatch':
    ensure => $::logwatch::ensure,
  }
}
