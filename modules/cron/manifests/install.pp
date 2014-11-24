# == Class: cron::install
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
#   'base::server'
#
# == About: this class
#
# description:
#   ensures cron package and necessary files are present
#
class cron::install {

  package { $::cron::params::package_name:
    ensure => present,
  }
}
