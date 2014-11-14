# == Class: boot
#
# Description:
#	Harden the boot process.
#
# LinuxGuide:
# 2.3.5.2
# 2.3.5.3
# 2.3.5.4
#
# CCERef#:
# CCE-3923-0
#	CCE-4144-2
#	CCE-4197-0
#	CCE-3923-0
#	CCE-4245-7

class boot (

  $config_file = $::boot::params::config_file

) inherits boot::params {

  verify_absolute_path($config_file)

  class { '::boot::install': } ->
  class { '::boot::config': } ~>
  class { '::boot::service': } ->
  Class['::boot']
}
