# == Class: ntp
#
# Installs and configures ntp according to USGCB best practices
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
# == USGCB info
#
# LinuxGuide:
#   3.10.2.1.1
#   3.10.2.1.2
#
# CCERef#:
#   CCE-4292-9

class ntp (
  $autoupdate        = $ntp::params::autoupdate,
  $config_file       = $ntp::params::config_file,
  $config_template   = $ntp::params::config_template,
  $disable_monitor   = $ntp::params::disable_monitor,
  $drift_file        = $ntp::params::drift_file,
  $log_file          = $ntp::params::log_file,
  $iburst_enable     = $ntp::params::iburst_enable,
  $keys_enable       = $ntp::params::keys_enable,
  $keys_file         = $ntp::params::keys_file,
  $keys_controlkey   = $ntp::params::keys_controlkey,
  $keys_requestkey   = $ntp::params::keys_requestkey,
  $keys_trusted      = $ntp::params::keys_trusted,
  $package_ensure    = $ntp::params::package_ensure,
  $package_name      = $ntp::params::package_name,
  $panic             = $ntp::params::panic,
  $preferred_servers = $ntp::params::preferred_servers,
  $restrict          = $ntp::params::restrict,
  $interfaces        = $ntp::params::interfaces,
  $servers           = $ntp::params::servers,
  $service_enable    = $ntp::params::service_enable,
  $service_ensure    = $ntp::params::service_ensure,
  $service_manage    = $ntp::params::service_manage,
  $service_name      = $ntp::params::service_name,
  $udlc              = $ntp::params::udlc
) inherits ntp::params {

  validate_absolute_path($config_file)
  validate_string($config_template)
  validate_bool($disable_monitor)
  validate_absolute_path($drift_file)
  if $logfile { validate_absolute_path($log_file) }
  validate_bool($iburst_enable)
  validate_bool($keys_enable)
  validate_re($keys_controlkey, ['^\d+$', ''])
  validate_re($keys_requestkey, ['^\d+$', ''])
  validate_array($keys_trusted)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($panic)
  validate_array($preferred_servers)
  validate_array($restrict)
  validate_array($interfaces)
  validate_array($servers)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)
  validate_bool($udlc)

  class { '::ntp::install': } ->
  class { '::ntp::config': } ~>
  class { '::ntp::service': } ->
  Class['::ntp']
}
