# Module: pam
#
# Class: pam
#
# Description:
# 	This class hardens the pam area
#
# LinuxGuide:
# 	2.3.3.1.1
# 	2.3.3.2
#		2.3.3.6
#
# CCERef#:
# 	CCE-3762-2
#		CCE-3410-8
#
class pam (

  $config_file   = $::pam::params::config_file
  $config_source = $::pam::params::config_source
  $package_name  = $::pam::params::package_name

) inherits pam::params {

validate_absolute_path($config_file)
validate_string($config_source)
validate_string($package_name)

  class { '::pam::install': } ->
  class { '::pam::config': } ~>
  Class['::pam']
}
