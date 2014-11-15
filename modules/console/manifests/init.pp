# == Class: console
#
# Installs and configures console according to USGCB best practices
#
# LinuxGuide:
#	2.3.1.1
#	2.2.2.1
#	2.3.3.4
#
# CCERef#:
#	CCE-4209-3
#
class console (

  $securetty_template = $::console::params::securetty_template
  $console_perms_template = $::console::params::console_perms_template
  $securetty_config = $::console::params::securetty_config
  $console_perms_config = $::console::params::console_perms_config

) inherits console::params {

  validate_string($console_perms_template)
  validate_string($securetty_template)
  validate_absolute_path($securetty_config)
  validate_absolute_path($console_perms_config)

  class { '::console::config': } ~>
  Class['::console']
}
