# == Class template::config
#
# This class is called from template
#
class ntp::config {
  file { $::ntp::params::config_file:
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template($::ntp::params::config_template),
    require => Class['ntp::install'],
  }
}
