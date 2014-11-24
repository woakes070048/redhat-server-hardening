# Class: samba::params
#
class samba::params {

  $ensure              = 'absent'

  $workgroup           = undef
  $server_string       = 'Samba Server Version %v'
  $interfaces          = []
  $hosts_allow         = []
  $shares              = {}
  $client_signing      = 'mandatory'

  $passdb_backend      = 'tdbsam'
  $domain_master       = false
  $domain_logons       = false
  $local_master        = undef
  $security            = 'user'
  $global_options      = []

  $ldap_suffix         = undef
  $ldap_url            = undef
  $ldap_ssl            = 'off'
  $ldap_admin_dn       = undef
  $ldap_admin_dn_pwd   = undef
  $ldap_group_suffix   = undef
  $ldap_machine_suffix = undef
  $ldap_user_suffix    = undef

  $config_template     = "${module_name}/smb.conf.erb"

  $default_packages    = ['samba', 'tdb-tools']
  $default_service     = ['smb', 'nmb']
  $default_secretstdb  = '/var/lib/samba/private/secrets.tdb'
  $default_config_file = '/etc/samba/smb.conf'
  $default_log_file    = '/var/log/samba/log.%m'

  case $::osfamily {
    'RedHat': {
      $packages        = $default_packages
      $service         = $default_service
      $secretstdb      = $default_secretstdb
      $config_file     = $default_config_file
      $log_file        = $default_log_file
    }
    default: {
      fail("${::operatingsystem} not supported"
    }
  }

  validate_string($workgroup)
  validate_string($server_string)
  validate_array($interfaces)
  validate_array($hosts_allow)
  validate_hash($shares)

  validate_string($passdb_backend)
  validate_string($domain_master)
  validate_string($domain_logons)
  validate_string($local_master)
  validate_string($security)
  validate_array($global_options)

  validate_string($ldap_suffix)
  validate_string($ldap_url)
  validate_string($ldap_ssl)
  validate_string($ldap_admin_dn)
  validate_string($ldap_admin_dn_pwd)
  validate_string($ldap_group_suffix)
  validate_string($ldap_machine_suffix)
  validate_string($ldap_user_suffix)

  validate_string($package)
  validate_string($service)
  validate_absolute_path($secretstdb)
  validate_absolute_path($config_file)
  validate_absolute_path($log_file)
}
