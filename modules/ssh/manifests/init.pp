# == Class: ssh
#
# Installs and configures ssh according to USGCB best practices
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
# == USGCB info
#
# LinuxGuide:
#   section x
#		section y
#
# CCERef#:
#   some CCE ref

class ssh (

  $client_package_name = $::ssh::params::client_package_name
  $server_package_name = $::ssh::params::server_package_name
  $server_service_name = $::ssh::params::server_service_name
  $client_ensure       = $::ssh::params::client_ensure
  $server_ensure       = $::ssh::params::server_ensure
  $ssh_known_hosts     = $::ssh::params::ssh_known_hosts
  $ssh_config          = $::ssh::params::ssh_config
  $sshd_config         = $::ssh::params::sshd_config

) inherits ssh::params {

  validate_string($client_package_name)
  validate_string($server_package_name)
  validate_string($server_service_name)
  validate_string($client_ensure)
  validate_string($server_ensure)
  validate_absolute_path($ssh_known_hosts)
  validate_absolute_path($ssh_config)
  validate_absolute_path($sshd_config)

  class { '::ssh::client::install': } ->
  class { '::ssh::client::config': }

  class { '::ssh::server::install': } ->
  class { '::ssh::server::config': } ~>
  class { '::ssh::server::service': } ->
  Class['::ssh']
}
