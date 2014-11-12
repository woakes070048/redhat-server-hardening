# == Class template::params
#
# This class is meant to be called from template
# It sets variables according to platform
#
class ntp::params {

  $autoupdate        = false
  $disable_monitor   = false
  $keys_enable       = false
  $keys_controlkey   = ''
  $keys_requestkey   = ''
  $keys_trusted      = []
  $log_file          = undef
  $package_ensure    = 'present'
  $preferred_servers = []
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $udlc              = false
  $interfaces        = []

  # On virtual machines allow large clock skews.
  $panic = str2bool($::is_virtual) ? {
    true    => false,
    default => true,
  }

  $default_package_name = ['ntp']
  $default_service_name = 'ntpd'
  $default_config       = '/etc/ntp.conf'
  $default_template     = "${module_name}/${module_name}.conf.erb"
  $default_keys_file    = '/etc/ntp/keys'
  $default_drift_file   = '/var/lib/ntp/drift'

  case $::osfamily {
    'RedHat': {
      $package_name    = $default_package_name
      $service_name    = $default_service_name
      $config_file     = $default_config
      $config_template = $default_template
      $keys_file       = $default_keys_file
      $drift_file      = $default_drift_file
      $servers     = [
        '0.centos.pool.ntp.org',
        '1.centos.pool.ntp.org',
        '2.centos.pool.ntp.org',
      ]
      $restrict        = []
      $iburst_enable   = false
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
