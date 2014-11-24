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
#   manages configuration of this module via parameters
#
class module::params {

  $syslog_ensure          = 'running'
  $syslog_config_template = "${module_name}/syslog.conf.erb"
  $syslog_template        = "${module_name}/syslog.erb"
  $default_package_name   = 'syslog'
  $default_service_name   = 'syslog'
  $default_config_file    = '/etc/syslog.conf'
  $default_syslog_file    = '/etc/sysconfig/syslog'
  $default_messages_file  = '/var/log/messages'
  $default_kern_file      = '/var/log/kern.log'
  $default_daemon_file    = '/var/log/daemon.log'
  $default_syslog_file    = '/var/log/syslog'
  $default_unused_file    = '/var/log/unused.log'
  $default_secure_file    = '/var/log/secure'
  $default_maillog_file   = '/var/log/maillog'
  $default_cron_file      = '/var/log/cron'

  case $::osfamily {
    'RedHat': {
      $service_name  = $default_service_name
      $package_name  = $default_package_name
      $messages_file = $default_messages_file
      $kern_file     = $default_kern_file
      $daemon_file   = $default_daemon_file
      $syslog_file   = $default_syslog_file
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
  verify_absolute_path($syslog_file)
  verify_absolute_path($unused_file)
  verify_absolute_path($secure_file)
  verify_absolute_path($maillog_file)
  verify_absolute_path($cron_file)
}
