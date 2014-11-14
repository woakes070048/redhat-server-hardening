# == Class: audit
#
# Installs and configures audit according to USGCB best practices
#
#
# Defines:
# 	None
#
# LinuxGuide:
# 	2.6.2.1
# 	2.6.2.3
# 	2.6.2.4
# 	2.6.2.4.1
# 	2.6.2.4.2
# 	2.6.2.4.3
# 	2.6.2.4.4
# 	2.6.2.4.5
# 	2.6.2.4.6
# 	2.6.2.4.7
# 	2.6.2.4.8
# 	2.6.2.4.9
# 	2.6.2.4.10
# 	2.6.2.4.11
# 	2.6.2.4.12
# 	2.6.2.4.13
#
# CCERef#:
# 	CCE-4292-9
#
class audit (

  $package_name = $::audit::params::package_name
  $service_name = $::audit::params::service_name
  $rules_source = $::audit::params::rules_source

) inherits audit::params {

  verify_string($package_name)
  verify_string($service_name)
  verify_absolute_path($rules_source)

  class { '::audit::install': } ->
  class { '::audit::config': } ~>
  class { '::audit::service': } ->
  Class['::audit']
}
