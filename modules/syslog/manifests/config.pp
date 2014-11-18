# == Class: syslog::service
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
#   [ 'rsyslog', 'syslog-ng' ]
#
# associated profiles/stacks:
#   'base::server::log'
#
# == About: this class
#
# description:
#   manages structure and content of module configuration
#
class syslog::config {

  file { $::syslog::params::syslog_config_file:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::syslog::params::syslog_config_template)
  }

  file { $::syslog::params::syslog_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::syslog::params::syslog_template)
  }
}
