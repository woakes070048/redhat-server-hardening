#
# Module: kernel
#
# Class: kernel
#
# Description:
# 	This class sets various Kernel parameters and removes wireless drivers.
#
# LinuxGuide:
# 	2.5.1.1
# 	2.5.1.2
#
# CCERef#:
#		CCE-4151-7, CCE-3561-8, CCE-4155-8, CCE-3339-9, CCE-4320-8, CCE-3644-2
#		CCE-4217-6, CCE-3840-6, CCE-3472-8, CCE-4186-3, CCE-4080-8, CCE-4091-5
#		CCE-4236-6, CCE-4133-5, CCE-4265-5, CCE-4170-7
#
class kernel (

  $network_config = $::kernel::params::network_config

) inherits kernel::params {

  validate_absolute_path($network_config)

  class { '::kernel::config': }
  Class['::kernel']
}
