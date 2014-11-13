# == Class module::params
#
# This class is meant to be called from module
# It sets variables according to platform
#
class module::params {

  $default_client_package_name = 'openssh-clients'
  $default_server_package_name = 'openssh-server'
  $default_server_service_name = 'sshd'
  $default_client_ensure       = 'present'
  $default_server_ensure       = 'present'
  $default_ssh_known_hosts     = '/etc/ssh/ssh_known_hosts'
  $default_ssh_config          = '/etc/ssh/ssh_config'
  $default_sshd_config         = '/etc/ssh/sshd_config'

  case $::osfamily {
    'RedHat': {
      $client_package_name = $default_client_package_name
      $server_package_name = $default_server_package_name
      $server_service_name = $default_server_service_name
      $client_ensure       = $default_client_ensure
      $server_ensure       = $default_server_ensure
      $ssh_known_hosts     = $default_ssh_known_hosts
      $ssh_config          = $default_ssh_config
      $sshd_config         = $default_sshd_config
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
