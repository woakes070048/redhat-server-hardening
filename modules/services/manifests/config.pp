# == Class: services::config
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
#   manages structure and content of services configuration
#

class services::config {
  file { '/etc/X11/xinit/xserverrc':
    ensure  => present,
    content => 'exec X :0 -nolisten tcp $@'
  }
}
