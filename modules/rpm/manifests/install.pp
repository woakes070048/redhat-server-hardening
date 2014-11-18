# == Class: rpm::install
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
#   ensures rpm package and necessary files are present
#
class rpm::install {

  package { $::rpm::package_name:
    ensure => present,
  }

  cron { 'rpm':
    command => "/bin/rpm -qVa > ${log_file}",
    user    => 'root',
    hour    => '6'
  }
}
