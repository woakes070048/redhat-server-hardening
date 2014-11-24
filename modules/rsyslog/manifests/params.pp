## == Class: rsyslog::params
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
#   [ 'syslog', 'syslog-ng' ]
#
# associated profiles/stacks:
#   'base::server'
#
# == About: this class
#
# description:
#   manages configuration of this module via parameters
#
class rsyslog::params {
  $rsyslog_ensure          = 'running'
  $rsyslog_config_template = "${module_name}/rsyslog.conf.erb"
  $rsyslog_template        = "${module_name}/rsyslog.erb"
  $default_package_name    = 'rsyslog'
  $default_service_name    = 'rsyslog'
  $default_config_file     = '/etc/rsyslog.conf'
  $default_rsyslog_file    = '/etc/sysconfig/rsyslog'
  $default_messages_file   = '/var/log/messages'
  $default_kern_file       = '/var/log/kern.log'
  $default_daemon_file     = '/var/log/daemon.log'
  $default_rsyslog_file    = '/var/log/rsyslog'
  $default_unused_file     = '/var/log/unused.log'
  $default_secure_file     = '/var/log/secure'
  $default_maillog_file    = '/var/log/maillog'
  $default_cron_file       = '/var/log/cron'

  case $::osfamily {
    'RedHat': {
      $service_name  = $default_service_name
      $package_name  = $default_package_name
      $messages_file = $default_messages_file
      $kern_file     = $default_kern_file
      $daemon_file   = $default_daemon_file
      $rsyslog_file  = $default_rsyslog_file
      $unused_file   = $default_unused_file
      $secure_file   = $default_secure_file
      $maillog_file  = $default_maillog_file
      $cron_file     = $default_cron_file
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  verify_string($package_name)
  verify_string($service_name)
  verify_string($service_replaced)
  verify_absolute_path($messages_file)
  verify_absolute_path($kern_file)
  verify_absolute_path($daemon_file)
  verify_absolute_path($rsyslog_file)
  verify_absolute_path($unused_file)
  verify_absolute_path($secure_file)
  verify_absolute_path($maillog_file)
  verify_absolute_path($cron_file)
}
